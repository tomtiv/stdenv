# NGINX REVERSE PROXY


***FOR DOCKER***
proxy_pass http://unix:/var/discourse/shared/standalone/nginx.http.sock:;

## REGEX RE-WRITE

if ($host ~* "^(.*)\.tomtiv\.me$"){
  set $subd $1;
  rewrite ^(.*)$ http://tomtiv.me/$subd permanent;
  break;
}



## SAMPLE LOCATION

  location /admin {
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-Scheme $scheme;
    proxy_set_header X-Forwarded-Proto  $scheme;
    proxy_set_header X-Forwarded-For    $remote_addr;
    proxy_set_header X-Real-IP		$remote_addr;
    proxy_pass       http://192.168.0.200:80;
    }


location / {

    ***NOT SURE WHAT THIS IS***
    proxy_set_header X-Forwarded-Host $server_name;

    proxy_http_version 1.1;
    proxy_set_header X-Forwarded-Scheme $scheme;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-For $remote_addr;
    proxy_set_header X-Real-IP $remote_addr;

    proxy_set_header X-Forwarded-Host $server_name;
    proxy_set_header Host "sub.domain.tld";

    proxy_pass https://sub.domainr.tld:443/rewritten/path/;
    proxy_pass http:/sub.domain.tld:8998;

    proxy_redirect off;

    add_header Pragma "no-cache";
    add_header Cache-Control "no-cache";

    sub_filter 'action="/'  'action="/mail/';
    sub_filter 'href="/'  'href="/mail/';
    sub_filter 'src="/'  'src="/mail/';
    sub_filter_once off;
}
## On domain root

This one's pretty simple, your reverse proxy configuration just needs to look like this:

location / {
	proxy_pass http://example.com:8998;
}

And you should be good to go!

## Using domain subpath

If you want to run YoutubeDL-Material in a subpath (e.g. https://example.com/ytdl instead of https://example.com), the configuration requires additional lines compared to instances on the document root. This is an example config where the desired path is /ytdl

location ~/ytdl(.*)$ {
	rewrite /ytdl/(.*) /  break;
	proxy_pass http://example.com:8998;
}

location /api/ {
	proxy_pass http://example.com:8998;
}

Note the additional rewrite rule and the required proxying of API calls in the /api route.


##  MISC

proxy_pass http://192.168.0.50:8998;
resolver 127.0.0.11 valid=30s;
proxy_redirect off;
proxy_set_header X-Forwarded-Host $server_name;



2022/10/26 22:17:07 [error] 1282#1282: *28104 SSL_do_handshake()
failed (SSL: error:1408F10B:SSL routines:ssl3_get_record:wrong version number)
while SSL handshaking to upstream,
client: 108.162.242.69,
server: hole.tomtiv.me,
request: "GET / HTTP/2.0",
upstream: "https://192.168.0.200:80/admin/",
host: "hole.tomtiv.me",
referrer: "http://192.168.0.210:81/"
