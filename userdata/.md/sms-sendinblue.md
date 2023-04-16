# SEINDINBLUE

thomas@tomtiv.me
myponyFr33D0!!


## EMAIL

Your SMTP Settings
SMTP Server: smtp-relay.sendinblue.com
Port 587
Login thomas@tomtiv.me

Master Password
FMDEG9XxZnKs0m2w


## SMS

sms-tomtiv-me
API-key
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
v3


## CURL EXAMPLE

curl --request POST \
     --url https://api.sendinblue.com/v3/transactionalSMS/sms \
     --header 'accept: application/json' \
     --header 'api-key: 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' \
     --header 'content-type: application/json' \
     --data '
{
  "type": "transactional",
  "unicodeEnabled": false,
  "sender": "4169989122",
  "recipient": "4169989122",
  "content": "THIS IS A TEST FROM SENDINBLUE",
  "tag": "text/sms",
  "webUrl": "https://wh.tomtiv.me/sms/",
  "organisationPrefix": "tomtiv.me"
}
'

## HTTP EXAMPLE

POST /v3/transactionalSMS/sms HTTP/1.1
Accept: application/json
Content-Type: application/json
Api-Key: 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
Host: api.sendinblue.com
Content-Length: 224

{"type":"transactional","unicodeEnabled":false,"sender":"4169989122","recipient":"4169989122","content":"THIS IS A TEST FROM SENDINBLUE","tag":"text/sms","webUrl":"https://wh.tomtiv.me/sms/","organisationPrefix":"tomtiv.me"}

### NODE.JS EXAMPLE

const SibApiV3Sdk = require('sib-api-v3-sdk');
const defaultClient = SibApiV3Sdk.ApiClient.instance;

let apiKey = defaultClient.authentications['api-key'];
apiKey.apiKey = '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';

let apiInstance = new SibApiV3Sdk.TransactionalSMSApi();

let sendTransacSms = new SibApiV3Sdk.SendTransacSms();

sendTransacSms = {
    "sender":"string",
    "recipient":"string",
    "content":"string",
};

apiInstance.sendTransacSms(sendTransacSms).then(function(data) {
  console.log('API called successfully. Returned data: ' + JSON.stringify(data));
}, function(error) {
  console.error(error);
});



## C EXAMPLE

CURL *hnd = curl_easy_init();

curl_easy_setopt(hnd, CURLOPT_CUSTOMREQUEST, "POST");
curl_easy_setopt(hnd, CURLOPT_URL, "https://api.sendinblue.com/v3/transactionalSMS/sms");

struct curl_slist *headers = NULL;
headers = curl_slist_append(headers, "accept: application/json");
headers = curl_slist_append(headers, "content-type: application/json");
headers = curl_slist_append(headers, "api-key: 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");
curl_easy_setopt(hnd, CURLOPT_HTTPHEADER, headers);

curl_easy_setopt(hnd, CURLOPT_POSTFIELDS, "{\"type\":\"transactional\",\"unicodeEnabled\":false,\"sender\":\"4169989122\",\"recipient\":\"4169989122\",\"content\":\"THIS IS A TEST FROM SENDINBLUE\",\"tag\":\"text/sms\",\"webUrl\":\"https://wh.tomtiv.me/sms/\",\"organisationPrefix\":\"tomtiv.me\"}");

CURLcode ret = curl_easy_perform(hnd);


### php exaple

include 'path/to/mailin-api/sms_api.php';

$mailin = new MailinSms('FMDEG9XxZnKs0m2w');

$mailin->addTo('33XXXXXXXXXX')

->setFrom('Thomas Tiv') // If numeric, then maximum length is 17 characters and if alphanumeric maximum length is 11 characters.

->setText('Text message to send') // 160 characters per SMS.

->setTag('Your tag name')

->setType('') // Two possible values: marketing or transactional.

->setCallback('http://callbackurl.com/');

$res = $mailin->send();

/**
Successful SMS sent message will be returned as:
{"status":"OK","number_sent":1,"to":"00XXXXXXXX","remaining_credit":9525,"reference":{"1":"cz2tjvs79vm079hpa"}}
Error will be returned as:
{"status":"KO","description":"Invalid telephone number."}
**/
