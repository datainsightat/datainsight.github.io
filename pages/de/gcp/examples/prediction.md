# Predict Visitor Purchases with BigQuery ML

## Setup

gcp > Big Data BigQuery
open 'data-to-insight' dataset

## Explore Dataset

Conversion rate:

    #standardSQL
    WITH visitors AS(
      SELECT
        COUNT(DISTINCT fullVisitorId) AS total_visitors
      FROM
        `data-to-insights.ecommerce.web_analytics`
    ),
    purchasers AS(
      SELECT
        COUNT(DISTINCT fullVisitorId) AS total_purchasers
      FROM
        `data-to-insights.ecommerce.web_analytics`
      WHERE
        totals.transactions IS NOT NULL
    )
    SELECT
      total_visitors,
      total_purchasers,
      total_purchasers / total_visitors AS conversion_rate
    FROM
      visitors, purchasers

Top 5 Products

    SELECT
      p.v2ProductName,
      p.v2ProductCategory,
      SUM(p.productQuantity) AS units_sold,
      ROUND(SUM(p.localProductRevenue/1000000),2) AS revenue
    FROM
      `data-to-insights.ecommerce.web_analytics`,
      UNNEST(hits) AS h,
      UNNEST(h.product) AS p
    GROUP BY
      1, 2
    ORDER BY
      revenue DESC
    LIMIT 5;

|Row|v2ProductName|v2ProductCategory|units_sold|revenue|
|-|-|-|-|-|
|1|Nest® Learning Thermostat 3rd Gen-USA - Stainless Steel|Nest-USA|17651|870976.95|
|2|Nest® Cam Outdoor Security Camera - USA|Nest-USA|16930|684034.55|
|3|Nest® Cam Indoor Security Camera - USA|Nest-USA|14155|548104.47|
|4|Nest® Protect Smoke + CO White Wired Alarm-USA|Nest-USA|6394|178937.6|
|5|Nest® Protect Smoke + CO White Battery Alarm-USA|Nest-USA|6340|178572.4|

How many customers bought on subsequent visits on the website?

    # visitors who bought on a return visit (could have bought on first as well
    WITH all_visitor_stats AS (
      SELECT
        fullvisitorid, # 741,721 unique visitors
        IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM
        `data-to-insights.ecommerce.web_analytics`
      GROUP BY
        fullvisitorid
    )
    SELECT
      COUNT(DISTINCT fullvisitorid) AS total_visitors,
      will_buy_on_return_visit
    FROM
      all_visitor_stats
    GROUP BY
      will_buy_on_return_visit
      
## Feature Selection

Select features and label to model data

    SELECT
      * EXCEPT(fullVisitorId)
    FROM
      # features
      (SELECT
        fullVisitorId,
        IFNULL(totals.bounces, 0) AS bounces,
        IFNULL(totals.timeOnSite, 0) AS time_on_site
      FROM
        `data-to-insights.ecommerce.web_analytics`
      WHERE
        totals.newVisits = 1)
      JOIN
      (SELECT
        fullvisitorid,
        IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM
          `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid)
      USING (fullVisitorId)
    ORDER BY time_on_site DESC
    LIMIT 10;
    
|Row|bounces|time_on_site|will_buy_on_return_visit|
|-|-|-|-|
|1|0|15047|0|
|2|0|12136|0|
|3|0|11201|0|

## Create BigQuery Dataset

gcp > BigQuery > project > Create dataset

## Select BigQuery Model

Create classification model

    CREATE OR REPLACE MODEL
      `ecommerce.classification_model`
    OPTIONS
      (
        model_type='logistic_reg',
        labels = ['will_buy_on_return_visit']
      )
    AS
      #standardSQL
      SELECT
        * EXCEPT(fullVisitorId)
      FROM
        # features
        (SELECT
          fullVisitorId,
          IFNULL(totals.bounces, 0) AS bounces,
          IFNULL(totals.timeOnSite, 0) AS time_on_site
        FROM
          `data-to-insights.ecommerce.web_analytics`
        WHERE
          totals.newVisits = 1
          AND date BETWEEN '20160801' AND '20170430') # train on first 9 months
        JOIN
        (SELECT
          fullvisitorid,
          IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
        FROM
            `data-to-insights.ecommerce.web_analytics`
        GROUP BY fullvisitorid)
        USING (fullVisitorId)
    ;
    
 > go to model

## Evaluate Performance

    SELECT
      roc_auc,
      CASE
        WHEN roc_auc > .9 THEN 'good'
        WHEN roc_auc > .8 THEN 'fair'
        WHEN roc_auc > .7 THEN 'not great'
      ELSE 'poor' END AS model_quality
    FROM
      ML.EVALUATE(MODEL ecommerce.classification_model,  (
    SELECT
      * EXCEPT(fullVisitorId)
    FROM
      # features
      (SELECT
        fullVisitorId,
        IFNULL(totals.bounces, 0) AS bounces,
        IFNULL(totals.timeOnSite, 0) AS time_on_site
      FROM
        `data-to-insights.ecommerce.web_analytics`
      WHERE
        totals.newVisits = 1
        AND date BETWEEN '20170501' AND '20170630') # eval on 2 months
      JOIN
      (SELECT
        fullvisitorid,
        IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM
          `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid)
      USING (fullVisitorId)
    ));


|Row|roc_auc|model_quality|
|-|-|-|
|1|0.724588|not great|
 
## Improve Performance

Create new model with additional feature 'maximumg checkout progress' (hits.eCommerceAction.action_type), of which 6 is a completed purchase.

    CREATE OR REPLACE MODEL `ecommerce.classification_model_2`
    OPTIONS
      (model_type='logistic_reg', labels = ['will_buy_on_return_visit']) AS
    WITH all_visitor_stats AS (
    SELECT
      fullvisitorid,
      IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid
    )
    # add in new features
    SELECT * EXCEPT(unique_session_id) FROM (
      SELECT
          CONCAT(fullvisitorid, CAST(visitId AS STRING)) AS unique_session_id,
          # labels
          will_buy_on_return_visit,
          MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,
          # behavior on the site
          IFNULL(totals.bounces, 0) AS bounces,
          IFNULL(totals.timeOnSite, 0) AS time_on_site,
          totals.pageviews,
          # where the visitor came from
          trafficSource.source,
          trafficSource.medium,
          channelGrouping,
          # mobile or desktop
          device.deviceCategory,
          # geographic
          IFNULL(geoNetwork.country, "") AS country
      FROM `data-to-insights.ecommerce.web_analytics`,
         UNNEST(hits) AS h
        JOIN all_visitor_stats USING(fullvisitorid)
      WHERE 1=1
        # only predict for new visits
        AND totals.newVisits = 1
        AND date BETWEEN '20160801' AND '20170430' # train 9 months
      GROUP BY
      unique_session_id,
      will_buy_on_return_visit,
      bounces,
      time_on_site,
      totals.pageviews,
      trafficSource.source,
      trafficSource.medium,
      channelGrouping,
      device.deviceCategory,
      country
    );

Evaluate model:

    #standardSQL
    SELECT
      roc_auc,
      CASE
        WHEN roc_auc > .9 THEN 'good'
        WHEN roc_auc > .8 THEN 'fair'
        WHEN roc_auc > .7 THEN 'not great'
      ELSE 'poor' END AS model_quality
    FROM
      ML.EVALUATE(MODEL ecommerce.classification_model_2,  (
    WITH all_visitor_stats AS (
    SELECT
      fullvisitorid,
      IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid
    )
    # add in new features
    SELECT * EXCEPT(unique_session_id) FROM (
      SELECT
          CONCAT(fullvisitorid, CAST(visitId AS STRING)) AS unique_session_id,
          # labels
          will_buy_on_return_visit,
          MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,
          # behavior on the site
          IFNULL(totals.bounces, 0) AS bounces,
          IFNULL(totals.timeOnSite, 0) AS time_on_site,
          totals.pageviews,
          # where the visitor came from
          trafficSource.source,
          trafficSource.medium,
          channelGrouping,
          # mobile or desktop
          device.deviceCategory,
          # geographic
          IFNULL(geoNetwork.country, "") AS country
      FROM `data-to-insights.ecommerce.web_analytics`,
         UNNEST(hits) AS h
        JOIN all_visitor_stats USING(fullvisitorid)
      WHERE 1=1
        # only predict for new visits
        AND totals.newVisits = 1
        AND date BETWEEN '20170501' AND '20170630' # eval 2 months
      GROUP BY
      unique_session_id,
      will_buy_on_return_visit,
      bounces,
      time_on_site,
      totals.pageviews,
      trafficSource.source,
      trafficSource.medium,
      channelGrouping,
      device.deviceCategory,
      country
    )
    ));

|Row|roc_auc|model_quality|
|-|-|-|
|1|0.910382|good|

## Predict which new customers wil come back and purchase

    SELECT
    *
    FROM
      ml.PREDICT(MODEL `ecommerce.classification_model_2`,
       (
    WITH all_visitor_stats AS (
    SELECT
      fullvisitorid,
      IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid
    )
      SELECT
          CONCAT(fullvisitorid, '-',CAST(visitId AS STRING)) AS unique_session_id,
          # labels
          will_buy_on_return_visit,
          MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,
          # behavior on the site
          IFNULL(totals.bounces, 0) AS bounces,
          IFNULL(totals.timeOnSite, 0) AS time_on_site,
          totals.pageviews,
          # where the visitor came from
          trafficSource.source,
          trafficSource.medium,
          channelGrouping,
          # mobile or desktop
          device.deviceCategory,
          # geographic
          IFNULL(geoNetwork.country, "") AS country
      FROM `data-to-insights.ecommerce.web_analytics`,
         UNNEST(hits) AS h
        JOIN all_visitor_stats USING(fullvisitorid)
      WHERE
        # only predict for new visits
        totals.newVisits = 1
        AND date BETWEEN '20170701' AND '20170801' # test 1 month
      GROUP BY
      unique_session_id,
      will_buy_on_return_visit,
      bounces,
      time_on_site,
      totals.pageviews,
      trafficSource.source,
      trafficSource.medium,
      channelGrouping,
      device.deviceCategory,
      country
    )
    )
    ORDER BY
      predicted_will_buy_on_return_visit DESC;
  
  ![Predict customers will buy on return](../../gcp_predict_1.png)
  
  ## XGBoost Model
  
      CREATE OR REPLACE MODEL `ecommerce.classification_model_3`
        OPTIONS
          (model_type='BOOSTED_TREE_CLASSIFIER' , l2_reg = 0.1, num_parallel_tree = 8, max_tree_depth = 10,
              labels = ['will_buy_on_return_visit']) AS
        WITH all_visitor_stats AS (
        SELECT
          fullvisitorid,
          IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
          FROM `data-to-insights.ecommerce.web_analytics`
          GROUP BY fullvisitorid
        )
        # add in new features
        SELECT * EXCEPT(unique_session_id) FROM (
          SELECT
              CONCAT(fullvisitorid, CAST(visitId AS STRING)) AS unique_session_id,
              # labels
              will_buy_on_return_visit,
              MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,
              # behavior on the site
              IFNULL(totals.bounces, 0) AS bounces,
              IFNULL(totals.timeOnSite, 0) AS time_on_site,
              totals.pageviews,
              # where the visitor came from
              trafficSource.source,
              trafficSource.medium,
              channelGrouping,
              # mobile or desktop
              device.deviceCategory,
              # geographic
              IFNULL(geoNetwork.country, "") AS country
          FROM `data-to-insights.ecommerce.web_analytics`,
             UNNEST(hits) AS h
            JOIN all_visitor_stats USING(fullvisitorid)
          WHERE 1=1
            # only predict for new visits
            AND totals.newVisits = 1
            AND date BETWEEN '20160801' AND '20170430' # train 9 months
          GROUP BY
          unique_session_id,
          will_buy_on_return_visit,
          bounces,
          time_on_site,
          totals.pageviews,
          trafficSource.source,
          trafficSource.medium,
          channelGrouping,
          device.deviceCategory,
          country
        );
 
 Evaluate
 
    #standardSQL
    SELECT
      roc_auc,
      CASE
        WHEN roc_auc > .9 THEN 'good'
        WHEN roc_auc > .8 THEN 'fair'
        WHEN roc_auc > .7 THEN 'not great'
      ELSE 'poor' END AS model_quality
    FROM
      ML.EVALUATE(MODEL ecommerce.classification_model_3,  (
    WITH all_visitor_stats AS (
    SELECT
      fullvisitorid,
      IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid
    )
    # add in new features
    SELECT * EXCEPT(unique_session_id) FROM (
      SELECT
          CONCAT(fullvisitorid, CAST(visitId AS STRING)) AS unique_session_id,
          # labels
          will_buy_on_return_visit,
          MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,
          # behavior on the site
          IFNULL(totals.bounces, 0) AS bounces,
          IFNULL(totals.timeOnSite, 0) AS time_on_site,
          totals.pageviews,
          # where the visitor came from
          trafficSource.source,
          trafficSource.medium,
          channelGrouping,
          # mobile or desktop
          device.deviceCategory,
          # geographic
          IFNULL(geoNetwork.country, "") AS country
      FROM `data-to-insights.ecommerce.web_analytics`,
         UNNEST(hits) AS h
        JOIN all_visitor_stats USING(fullvisitorid)
      WHERE 1=1
        # only predict for new visits
        AND totals.newVisits = 1
        AND date BETWEEN '20170501' AND '20170630' # eval 2 months
      GROUP BY
      unique_session_id,
      will_buy_on_return_visit,
      bounces,
      time_on_site,
      totals.pageviews,
      trafficSource.source,
      trafficSource.medium,
      channelGrouping,
      device.deviceCategory,
      country
    )
    ));
    
|Row|roc_auc|model_quality|
|-|-|-|
|1|0.9218131868131868|good|
    
## Boosted Tree Classifier

    SELECT
    *
    FROM
      ml.PREDICT(MODEL `ecommerce.classification_model_3`,
       (
    WITH all_visitor_stats AS (
    SELECT
      fullvisitorid,
      IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, 1, 0) AS will_buy_on_return_visit
      FROM `data-to-insights.ecommerce.web_analytics`
      GROUP BY fullvisitorid
    )
      SELECT
          CONCAT(fullvisitorid, '-',CAST(visitId AS STRING)) AS unique_session_id,
          # labels
          will_buy_on_return_visit,
          MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,
          # behavior on the site
          IFNULL(totals.bounces, 0) AS bounces,
          IFNULL(totals.timeOnSite, 0) AS time_on_site,
          totals.pageviews,
          # where the visitor came from
          trafficSource.source,
          trafficSource.medium,
          channelGrouping,
          # mobile or desktop
          device.deviceCategory,
          # geographic
          IFNULL(geoNetwork.country, "") AS country
      FROM `data-to-insights.ecommerce.web_analytics`,
         UNNEST(hits) AS h
        JOIN all_visitor_stats USING(fullvisitorid)
      WHERE
        # only predict for new visits
        totals.newVisits = 1
        AND date BETWEEN '20170701' AND '20170801' # test 1 month
      GROUP BY
      unique_session_id,
      will_buy_on_return_visit,
      bounces,
      time_on_site,
      totals.pageviews,
      trafficSource.source,
      trafficSource.medium,
      channelGrouping,
      device.deviceCategory,
      country
    )
    )
    ORDER BY
      predicted_will_buy_on_return_visit DESC;
