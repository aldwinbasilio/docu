#!/usr/bin/env bash

curl -u "$GQL_OAUTH_USERNAME:$GQL_OAUTH_PASSWORD" \
  --location "$OAUTH_URL" \
  --header "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "grant_type=client_credentials"
