#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MCP_JSON="$SCRIPT_DIR/../../../.mcp.json"

# Open the token generation page in the default browser
open "https://mcp-prod-gateway.mcp.prd.aws.asurion.net/generate-token"

echo ""
echo "A browser tab has been opened to generate your MCP gateway token."
echo "Once you have the token, paste it below and press Enter:"
echo ""
read -r -p "Token: " TOKEN

if [[ -z "$TOKEN" ]]; then
  echo "Error: No token provided. Aborting."
  exit 1
fi

# Replace all Authorization Bearer values (active and commented-out lines)
sed -i '' -E 's|("Authorization": "Bearer )[^"]*"|\1'"$TOKEN"'"|g' "$MCP_JSON"

echo ""
echo "Done. Authorization headers updated in: $MCP_JSON"
