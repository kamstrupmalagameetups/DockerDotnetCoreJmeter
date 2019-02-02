#!bin/bash
WEBAPI_URL="http://localhost:44000/api/values/name"
for i in `seq 1 10000`;
do
  printf "Request #$i HTTP GET $WEBAPI_URL\n"
  curl $WEBAPI_URL
  printf "\n"
  sleep 0.5
done