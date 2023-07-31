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
