# AUTHOR: dukeofdisaster
#
# DESCRIPTION: covers some basic usage of nim httpClient
# 	- note: 
#
# (c) 2019
import httpClient
import json
var client = newHttpClient(timeout=5)

# getContent() returns a string that can be subscripted
#echo client.getContent("http://google.com")[22..44]

#[ if you want a response to work with, request() is there
HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Accept-Encoding": "gzip, deflate",
    "Connection":"close",
    "Content-Type":"application/x-www-form-urlencoded"}
]#

# similar dictionary style as python
# note: Field names will be lowered, not accepted as is
client.headers = newHttpHeaders({ 
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Accept-Encoding": "gzip, deflate",
    "Connection":"close",
    "Content-Type":"application/x-www-form-urlencoded"})

# data specified in body; wonder if this works with binary data
# This is where json import comes into play: %*
let body = %*{ "username" : "password"}

let response = client.request("http://localhost/", httpMethod = HttpPost, body = $body)
# response.status is a string value
if response.status == "200":
    echo response.body
else:
    echo response.headers
    echo()
    echo response.headers["content-type"]
    echo()
    echo response.headers["server"]
