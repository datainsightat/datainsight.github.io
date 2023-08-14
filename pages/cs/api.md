# API (Application Programming Interface)

## General

|Letter|Word|Meaning|
|-|-|-|
|A|Application|Software that does a task|
|P|Programming|Program that does the task in the Application|
|I|Interface|Place to the program to run|

Advantages
* Just use the program, don't write it
* Platform independent
* Upgrade safe
</a>

![request_response](../drawio/request_response.drawio.svg)

__API Mashup__: An API that is calling other APIs.

##  Web Service

API that uses the internet. All web services are APIs, but not all APIs are web services.  

Web services use:
* XML or JSON to format data over the internet
* REST, SOAP, or XML/RPC to transfer that data
</a>

### HTTP (HyperText Transfer Protocol)

|http|REQUEST|RESPONSE|
|-|-|-|
|startline|Version (1.1), Method, Folders, Parameters|Version (1.1), Status|
|headers|Host (www.google.com), Token|Cookies, Html|
|blank line|||
|body|Username, Password|Html|

#### Startline

||REQUEST|RESPONSE|
|-|-|-|
|Name|Start Line, Request Line|Start Line, Response Line, Status Line|
|HTTP Version|HTTP/1.1|HTTP/1.1|
|Method|GET, POST, PUT, DELETE|-|
|API Program Folder Location|/search|-|
|Parameters|?q=tuna|-|
|Status|-|200 OK|
|Format|Method(space)API Program Folder+Parameters(space)HTTP Version|HTTP Version(space)Status code|
|Example|GET /search?q=tuna HTTP/1.1|HTTP/1.1 200 OK|

##### Methods

__C__.reate __R__.ead __U__.pdate __D__.elete

|Method|Function|Itempodent (safe to repeat)|
|-|-|-|
|GET|Get information|yes|
|POST|Create information|no|
|PUT|Change Information|yes|
|DELETE|Delete Information|yes|

##### Status Codes

|Code|Description|
|-|-|
|1xx|Still running, wait|
|2xx|Success|
|3xx|Redirection|
|4xx|Error from origin|
|5xx|Error from destination|

## XML (eXtensible Markup Language)

[W3 Schools](https://www.w3schools.com/xml/xml_whatis.asp)  

test.xml
```xml
<?xml version="1.0"?>
<Pizza>
  <Size>Small</Size>
  <Toppings>
    <Topping>Onions</Topping>
    <Topping>Mushrooms</Topping>
  </Toppings>
</Pizza>
```

## JSON (JavaScript Object Notation)

[W3 Schools](https://www.w3schools.com/js/js_json_intro.asp)  

test.json
```json
{ "Pizza" : [
  {"Size" : "Small",
    "Toppings" : ["Onions","Mushrooms"],
  },
  {"Size" : "Large",
    "Toppings" : ["Ham","Egg"],
  }
  ]
}
```

## SOAP (Simple Object Access Protocol)

[W3 Schools](https://www.w3schools.com/xml/xml_soap.asp)  

Soap uses a WSDL (Web Services Description Language) that describes the web service. SOAP uses POST method.

|Item|Content|
|-|-|
|Start Line|POST WSL HTTP Version|
|Header Line|Content-Type: text/xml|
|Blank Line|-|
|Body|XML envelope formed using WSDL|

```xml
<?xml version="1.0"?>

<soap:Envelope
xmlns:soap="http://www.w3.org/2003/05/soap-envelope/"
soap:encodingStyle="http://www.w3.org/2003/05/soap-encoding">

<soap:Header>
...
</soap:Header>

<soap:Body>
...
  <soap:Fault>
  ...
  </soap:Fault>
</soap:Body>

</soap:Envelope>
```

## REST (Representational State Transfer)

[W3c](https://www.w3.org/2001/sw/wiki/REST)  

|Item|Content|
|-|-|
|Start Line|GET, POST, PUT, DELETE, etc|
|Header Line|All|
|Blank Line|-|
|Body|JSON, XML, Image, Html, ...|

### Start Line
```
PUT
```

### Header Line
```
Authorization:Bearer ...
Accept:application/json
Content-Type:application/json
Content-Language:en-US
```

### Body
```json
{
  "availability": {
    "shipToLocationAbailability": {
      "quantity": 50
    }
  },
  "condition": "NEW",
  "product": {
    "title": "An Item"
  }
}
```

#### Demo

[Twitter API](https://developer.twitter.com/en/docs/twitter-api)

```python
import tweepy

client_secret = '1eQr5yqKHnzXKJHCCsZ-fwo4YZ1OvXdd6k-5ub68aANVskxr8N'

ak = 'xxx'
aks = 'xxx'

at = 'xxx'
ats = 'xxx'

def OAuth():
    try:
        auth = tweepy.OAuthHandler(ak,aks)
        auth.set_access_token(at,ats)
        return auth
    except Exception as e:
        return None

oauth = OAuth()
apicall = tweepy.API(oauth)

apicall.update_status('Here is a sample tweet from the API call program.')

print('Tweet created')
```

## API Access

###  Authorization and Authentication

* Authentication: Prove Identity
* Authorization: Limited Access
<a/>

|Name|Authentication|Authorization|Examples|
|-|-|-|-|
|No Auth|N|N|Google search page|
|Basic Auth|Y|N|Email|
|Bearer Token|N|Y|Not many|
|OAuth|Y|Y|Wayz|
|Two Factor|Y|N|Git|

## Apps

