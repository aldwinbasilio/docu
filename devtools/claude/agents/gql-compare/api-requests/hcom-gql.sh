#!/usr/bin/env bash

curl --location "$HCOM_GQL_HOST" \
--header "Accept: application/json" \
--header "asurion-correlation-id: $CORRELATION_ID" \
--header "asurion-client: ALPHA-Agent" \
--header "asurion-clientid: $CLIENT_ID" \
--header "asurion-lineofbusiness: Mobility" \
--header "asurion-clientchannelid: $CLIENT_CHANNEL_ID" \
--header "asurion-region: NA Region" \
--header "Content-Type: application/json" \
--header "Asurion-Invocation: HCOM" \
--header "asurion-userprofile: HQDOMAIN_ALPHA-NA-CST-DEV" \
--header "asurion-interactionlineid: $INTERACTION_LINE_ID" \
--header "auth-type: OpenId" \
--header "Authorization: Bearer $ACCESS_TOKEN" \
--data "$PAYLOAD"
