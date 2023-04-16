# SendInBlue

- [SendInBlue](#sendinblue)
  - [SMTP](#smtp)
  - [API](#api)
  - [Examples](#examples)
    - [curl](#curl)
    - [Node.js](#nodejs)
    - [POSTFIX](#postfix)
    - [PHP](#php)

[sendinblue.com](https://app-smtp.sendinblue.com)

## SMTP

```smtp
SMTP Server: smtp-relay.sendinblue.com
Port: 587
Login: tomtiv@gmail.com
password: 8KIOqtskYAMTGFSd
```

## API

```send-tomtiv
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
```

## Examples

### curl

```shell
# ------------------
# Create a campaign \
# ------------------
curl -H 'api-key:YOUR_API_V3_KEY' \
-X POST -d '{ \
# Define the campaign settings \
"name":"Campaign sent via the API", \
"subject":"My subject", \
"sender": { "name": "From name", "email":"tomtiv@gmail.com" }, \
"type": "classic", \
# Content that will be sent \
"htmlContent": "Congratulations! You successfully sent this example campaign via the Sendinblue API.", \
# Select the recipients\
"recipients": { "listIds": [2,7] }, \
# Schedule the sending in one hour\
"scheduledAt": "2018-01-01 00:00:01", \
}'
'https://api.sendinblue.com/v3/emailCampaigns'
```

### Node.js

```javascript
# ------------------
# Create a campaign\
# ------------------
# Include the Sendinblue library\
var SibApiV3Sdk = require('sib-api-v3-sdk');
var defaultClient = SibApiV3Sdk.ApiClient.instance;
# Instantiate the client\
var apiKey = defaultClient.authentications['api-key'];
apiKey.apiKey = 'YOUR_API_V3_KEY';
var apiInstance = new SibApiV3Sdk.EmailCampaignsApi();
var emailCampaigns = new SibApiV3Sdk.CreateEmailCampaign();
# Define the campaign settings\
emailCampaigns.name = "Campaign sent via the API";
emailCampaigns.subject = "My subject";
emailCampaigns.sender = {"name": "From name", "email":"tomtiv@gmail.com"};
emailCampaigns.type = "classic";
# Content that will be sent\
htmlContent: 'Congratulations! You successfully sent this example campaign via the Sendinblue API.',
# Select the recipients\
recipients: {listIds: [2, 7]},
# Schedule the sending in one hour\
scheduledAt: '2018-01-01 00:00:01'
}
# Make the call to the client\
apiInstance.createEmailCampaign(emailCampaigns).then(function(data) {
console.log('API called successfully. Returned data: ' + data);
}, function(error) {
console.error(error);
});
```

### POSTFIX

To configure Postfix, edit the file /etc/postfix/main.cf
add the following code at the end :

```postfix
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = static:tomtiv@gmail.com:8KIOqtskYAMTGFSd
smtp_sasl_security_options = noanonymous
smtp_tls_security_level = may
header_size_limit = 4096000
relayhost = smtp-relay.sendinblue.com:587
```

### PHP

Download the library and host it
PHP code to send emails

```php
include 'path/to/mailin-api/Mailin.php';
$mailin = new Mailin('tomtiv@gmail.com', '8KIOqtskYAMTGFSd');
$mailin->
addTo('tomtiv@gmail.com', 'Thomas Tiv')->
setFrom('tomtiv@gmail.com', 'Thomas Tiv')->
setReplyTo('tomtiv@gmail.com','Thomas Tiv')->
setSubject('Enter the subject here')->
setText('Hello')->
setHtml('<strong>Hello</strong>');
$res = $mailin->send();
/**
Successful send message will be returned in this format:
{'result' => true, 'message' => 'Email sent'}
*/
```
