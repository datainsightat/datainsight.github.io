# Introduction

.gitlab-ci.yml

    stages:
      - prep
      - build
      - test

    prepare the car:
      stage: prep
      script:
        - mkdir build
        - cd build
        - touch car.txt
      artifacts:
        paths:
          - build/

    build the car:
      stage: build
      script:
        - echo "chassis" >> car.txt
        - echo "engine" >> car.txt
        - echo "wheels" >> car.txt
      artifacts:
        paths:
          - build/

    author:
      stage: build
      script:
        - mkdir meta
        - cd meta
        . echo $GITLAB_USER_NAME > author.txt
      artifacs:
      paths:
        - meta/

    test the car:
      stage: test
      script:
        - test -f build/car.txt
        - cd build
        - grep "chassis" car.txt
        - grep "engine" car.txt
        - grep "wheels" car.txt

## Gitlab Architecture

• Gitlab Server
  ○ Gitlab Runners

# Basic CI/CD Workflow

## What is CI/CD?
Continuous Integration / Continuous Deployment

CI | CD
Code  > Build > Quality > Test > Package | Review > Stage > Production

## Node.js, npm

Node.js JacaScript runtime
npm: Node Package Manager

    $ node --version
    $ npm --version

## Gatsby

    $ npm install -g gatsby-cli
    $ gatsby net static-website
    $ cd static-website
    $ gatsby develop

## Docker

### Gitlab Pipeline

.gitlabl-ci.yml

    build website:
      image: node
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

## Test Stage

    $ grep -q "xxx" index.html
    $ echo $?

.gitlabl-ci.yml

    stages:
      - build
      - test

    build website:
      stage: build
      image: node
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    test artifact:
      stage: test
      script:
        - grep "Gatsby" ./public/index.html
        - grep "xxxxxxx ./public/index.html

## Run Jobs Parallel

.gitlabl-ci.yml

    stages:
      - build
      - test

    build website:
      stage: build
      image: node
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    test artifact:
      image: alpine
      stage: test
      script:
        - grep "Gatsby" ./public/index.html

    test website:
      image: node
      stage: test
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby serve
        - curl "http://localhost:9000" | grep -q "Gatsby" 

## Run Jobs in Background

    test website:
      script:
        - gatsby serve &
        - sleep 3
        - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby" 


## Environment Variables

Gitlab > Settings > CI/CD > Environment Variables

## Deploy

.gitlabl-ci.yml

    image: node

    stages:
      - build
      - test
      - deploy

    build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    test artifact:
      image: alpine
      stage: test
      script:
        - grep "Gatsby" ./public/index.html

    test website:
      stage: test
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby serve
        - curl "http://localhost:9000" | grep -q "Gatsby" 

    depoy to surge:
      stage: deploy
      script:
        - npm install --global surge
        - surge --project ./public --domain xxxx.surge.sh!
 
 
# Gitlab CI Fundamentals

## Predifined Environment Variables

https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

CI_COMMIT_SHORT_SHA

.gitlabl-ci.yml

    ***
    build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
        - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html
      artifact:
        paths:
          - ./public
    ***

## Pipeline Triggers

CI/CD > Schedules

## Caches

### Option 1 - Inside Job

.gitlabl-ci.yml

    ***
    build website:
      stage: build
      cache:
        key: ${CI_COMMIT_REF_SLUG}
        paths:
          - node_modules/
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
        - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html
      artifact:
        paths:
          - ./public
    ***
    
### Option 2 - Global

.gitlabl-ci.yml

    image: node

    stages:
      - build
      - test
      - deploy

      cache:
        key: ${CI_COMMIT_REF_SLUG}
        paths:
          - node_modules/

    build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    ***

## Environments

.gitlabl-ci.yml

    image: node

    stages:
      - build
      - test
      - deploy staging
      - deploy production
      - production tests

    build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    test artifact:
      image: alpine
      stage: test
      script:
        - grep "Gatsby" ./public/index.html

    test website:
      stage: test
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby serve
        - curl "http://localhost:9000" | grep -q "Gatsby" 

    deploy staging:
      stage: deploy production
      environment:
        name: staging
        url: xxxx-staging.surge.sh
      script:
        - npm install --global surge
        - surge --project ./public --domain xxxx-staging.surge.sh

    deploy production:
      stage: deploy production
      environment:
        name: staging
        url: xxxc.surge.sh
      script:
        - npm install --global surge
        - surge --project ./public --domain xxxx.surge.sh

    production tests:
      image: alpine
      stage: production tests
      script:
        - apk add --no-cache curl
        - curl -s "https://xxxx.surge.sh" | grep -q "Hi people"
        - curl -s "https://xxxx.surge.sh" | grep -q "$CI_COMMIT_SHORT_SHA"
## Variables

.gitlab-ci.yml

    image: node

    stages:
      - build
      - test
      - deploy staging
      - deploy production
      - production tests

    cache:
      key: ${CI_COMMIT_REF_SLUG}
      paths:
        - node_modules/

    variables:
      STAGING_DOMAIN: xxxx-staging.surge.sh
      PRODUCTION_DOMAIN: xxxx.surge.sh

    build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    test artifact:
      image: alpine
      stage: test
      script:
        - grep "Gatsby" ./public/index.html

    test website:
      stage: test
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby serve
        - curl "http://localhost:9000" | grep -q "Gatsby" 

    deploy staging:
      stage: deploy production
      environment:
        name: staging
        url: https://$STAGING_DOMAIN
      script:
        - npm install --global surge
        - surge --project ./public --domain $STAGING_DOMAIN

    deploy production:
      stage: deploy production
      environment:
        name: staging
        url: https://$PRODUCTION_DOMAIN
      script:
        - npm install --global surge
        - surge --project ./public --domain $PRODUCTION_DOMAIN

    production tests:
      image: alpine
      stage: production tests
      script:
        - apk add --no-cache curl
        - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "Hi people"
        - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "$CI_COMMIT_SHORT_SHA"

## Manually Triggering Jobs

.gitlabl-ci.yml

    ***

    deploy production:
      stage: deploy production
      environment:
        name: staging
        url: https://$PRODUCTION_DOMAIN
      when: manual
      allow_failure: false
      script:
        - npm install --global surge
        - surge --project ./public --domain $PRODUCTION_DOMAIN

    ***
    
## Branches

.gitlabl-ci.yml

    ***

    deploy production:
      stage: deploy production
      environment:
        name: staging
        url: https://$PRODUCTION_DOMAIN
      only:
        - master
      script:
        - npm install --global surge
        - surge --project ./public --domain $PRODUCTION_DOMAIN

    production tests:
      image: alpine
      stage: production tests
      only:
        - master
      script:
        - apk add --no-cache curl
        - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "Hi people"
        - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "$CI_COMMIT_SHORT_SHA"

## Dynamic Environments

Create environment for every merge request

.gitlabl-ci.yml

    image: node

    stages:
      - build
      - test
      - deploy review
      - deploy staging
      - deploy production
      - production tests

    cache:
      key: ${CI_COMMIT_REF_SLUG}
      paths:
        - node_modules/

    variables:
      STAGING_DOMAIN: xxxx-staging.surge.sh
      PRODUCTION_DOMAIN: xxxx.surge.sh

    build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public

    test artifact:
      image: alpine
      stage: test
      script:
        - grep "Gatsby" ./public/index.html

    test website:
      stage: test
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby serve
        - curl "http://localhost:9000" | grep -q "Gatsby" 

    deploy review:
      stage: deploy review
      only:
        - merge_requests
      environment:
        name: review/$CI_COMMIT_REF_NAME
        url: https://xxxx-$CI_ENVIRONMENT_SLUG.surge.sh
      script:
        - npm install --global surge
        - surge --project ./public --domain xxxx-$CI_ENVIRONMENT_SLUG.surge.sh

    ***

## Destroying Environments

    $ surge teardown xxxx.surge.sh
    
.gitlabl-ci.yml

    ***

    deploy review:
      stage: deploy review
      only:
        - merge_requests
      environment:
        name: review/$CI_COMMIT_REF_NAME
        url: https://xxxx-$CI_ENVIRONMENT_SLUG.surge.sh
        on_stop: stop review
      script:
        - npm install --global surge
        - surge --project ./public --domain xxxx-$CI_ENVIRONMENT_SLUG.surge.sh

    stop review:
      stage: deploy review
      only:
        - merge_requests
      variables:
        GIT_STRATEGY: none
      script:
        - npm install --global surge
        - surge teardown xxxx-$CI_ENVIRONMENT_SLUG.surge.sh
      when: manual
      environment:
        name: review/$CI_COMMIT_REF_NAME
        action: stop

    ***

## Before & After Script

Used for install dependecies in before_script

.gitlabl-ci.yml

    ***

    deploy production:
      stage: deploy production
      environment:
        name: staging
        url: https://$PRODUCTION_DOMAIN
      only:
        - master
      before_script:
        - echo "Deploying to production"
        - npm install --global surge
      script:
        - surge --project ./public --domain $PRODUCTION_DOMAIN

    ***
    
# YAML Basics
 
## Syntax

test.yml

    # Comment
    person:
      name: john
      age: 29
      isMale: true
      stuff:
        - laptop
        - car
        - bike
      food: [pizza, donuts, coke]
      friends:
        - name: Jane
          age: 19
        - name: Mike
          age: 22
          
## Disabling Jobs

    ***
    .build website:
      stage: build
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
      artifact:
        paths:
          - ./public
    ***
    
## Anchors

    # Comment

    base_person: &base
      city: nyc
      country: usa

    person:
      <<: *base
      name: &name john
      age: 29
      isMale: true
      stuff:
        - laptop
        - car
        - bike
      food: [pizza, donuts, coke]
      friends:
        - name: Jane
          age: 19
        - name: Mike
          age: 22
      self: *name

## Job Templates

    image: node:10

    stages:
      - build
      - test
      - deploy review
      - deploy staging
      - deploy production
      - production tests

    cache:
      key: ${CI_COMMIT_REF_SLUG}
      paths:
        - node_modules/

    variables:
      STAGING_DOMAIN: instazone-staging.surge.sh
      PRODUCTION_DOMAIN: instazone.surge.sh

    build website:
      stage: build
      only:
        - master
        - merge_requests
      script:
        - echo $CI_COMMIT_SHORT_SHA
        - npm install
        - npm install -g gatsby-cli
        - gatsby build
        - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html
      artifacts:
        paths:
          - ./public

    test artifact:
      image: alpine
      stage: test
      only:
        - master
        - merge_requests
      script:
        - grep -q "Gatsby" ./public/index.html

    test website:
      stage: test
      only:
        - master
        - merge_requests
      script:
        - npm install
        - npm install -g gatsby-cli
        - gatsby serve &
        - sleep 3
        - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"

    deploy review:
      stage: deploy review
      only:
        - merge_requests
      environment:
          name: review/$CI_COMMIT_REF_NAME
          url: https://instazone-$CI_ENVIRONMENT_SLUG.surge.sh
          on_stop: stop review
      script:
        - npm install --global surge
        - surge --project ./public --domain instazone-$CI_ENVIRONMENT_SLUG.surge.sh

    stop review:
      stage: deploy review
      only:
        - merge_requests
      variables:
        GIT_STRATEGY: none
      script:
        - npm install --global surge
        - surge teardown instazone-$CI_ENVIRONMENT_SLUG.surge.sh
      when: manual
      environment:
        name: review/$CI_COMMIT_REF_NAME
        action: stop

    .deploy_template: &deploy
      only:
        - master
      script:
        - npm install --global surge
        - surge --project ./public --domain $DOMAIN
      environment:
        url: http://$DOMAIN

    deploy staging:
      <<: *deploy
      stage: deploy staging
      variables:
        DOMAIN: $STAGING_DOMAIN
      environment:
        name: staging

    deploy production:
      <<: *deploy
      stage: deploy production
      variables:
        DOMAIN: $PRODUCTION_DOMAIN
      environment:
        name: production

    production tests:
      image: alpine
      stage: production tests
      only:
        - master  
      script:
        - apk add --no-cache curl
        - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "Hi people"
        - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "$CI_COMMIT_SHORT_SHA"
        
 # Source
 
 https://www.udemy.com/share/101tcu3@turtaB_9G3MUry_KPrGUt0rcHoPfdDOTyUBCm6GCE-9kZ5lcuZo_fXrVuJ2pgWjO/
