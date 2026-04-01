### Given:

- If the environment we need to check is SQA, the log group we need to check is "/aws/lambda/enrich-comm-hcom-enricher-sqa", the GraphQL host we will be using is $ALPHA_GQL_HOST and $HCOM_GQL_HOST respectively, and output the comparison results in "./output/comparison-results.md"
- If the environment we need to check is EUSQA, the log group we need to check is "/aws/lambda/enrich-comm-hcom-enricher-eusqa", The GraphQL host we will be using is $ALPHA_GQL_HOST_EUSQA and $HCOM_GQL_HOST_EUSQA respectively, and output the comparison results in "./output/comparison-results-eu.md"
- Create a progress tracker at output/progress.json. Before starting any comparisons, read it to see what's already done. After each comparison, update it. Include: template name, environment, timestamp, result status. If progress.json doesn't exist, create it using the information available in comparison-results-eu.md and comparison-results.md. Always commit progress.json updates so no work is lost between sessions.

### Steps for verifying HCOMM's GQL implementation

1. Source the ENV from the "./.env" file
2. Execute "./api-requests/auth.sh", then set the ENV $ACCESS_TOKEN with the access_token value, only get the access token again if it's expired already
3. Using the "awslabs.cloudwatch-mcp-server" MCP server, find a log in Cloudwatch where the "log.modelname" is "enrich-comm-hcom-enricher-sqa", "log.operationName" is "Enrichment" and "log.retryCount" is 0, then take note of its "log.serviceRequestId", excluding the "log.operationName" we will be using these fields to filter out the logs that we'll be checking further on. and make sure "Dynamic-Query-Creation" and "Client-Config-Record" "log.operationName" are present from this serviceRequestId, if not find another one by incrementing "log.retryCount" each time or find a different serviceRequestId
4. Get the "CommEnrichmentRequest" object from the "log.logMessage", then set the ENV $PAYLOAD with this value
5. Find a log with "log.operationName" "Client-Config-Record", set the ENVs $CLIENT_CHANNEL_ID with the "ClientChannelId" value and $CLIENT_ID with the "ClientId" from the "log.logMessage"
6. Find a log with "log.operationName" "Dynamic-Query-Creation", and get the "responseBody" object from the "logMessage", then set the ENV $QUERY with this value
7. Create a GQL payload using the $QUERY and $PAYLOAD and execute "./api-requests/alpha-gql.sh" and "hcom-gql.sh" using this payload, then compare the response of both. If there's a failure in getting a response, show the reason why and retry again in a few seconds. Also show me which client and template this comm is
8. Output the comparison results including the details
