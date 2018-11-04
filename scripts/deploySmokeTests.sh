#!/bin/bash

APP_TEMP_ROUTE=$1
echo "Smoke testing $APP_TEMP_ROUTE"

TMPOUT=$(mktemp)
trap "rm -f \"$TMPOUT\""0 1 2 3 15

http_code=$(curl -s -o $TMPOUT $APP_TEMP_ROUTE/version --w "%{http_code}")

if [[ $http_code -eq 200 ]]; then
  echo "GET /version success"
  exit 0
else
  echo "***ERROR: GET /version returned unexepcted code $http_code"
  cat $TMPOUT
  exit 1
fi
