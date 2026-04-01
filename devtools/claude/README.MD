## Setup

Note: This is assuming that you have requested the access for `gen-ai-preview` in GCP, and for `MCP Gateway`<hr />

1. Install brew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install gcloud-cli

```shell
brew install --cask gcloud-cli
```

3. Setup Google Cloud
   https://asurion.atlassian.net/wiki/spaces/CG/pages/91118689/Google+Cloud+Access
4. Install claude-code

```shell
brew install --cask claude-code
```

5. Install mise

```shell
curl https://mise.run | sh
mise install # install tools specified in mise.toml
```

6. Install python packages

```shell
python3 -m pip install -r requirements.txt
```

1. Rename .mcp.json.example to .mcp.json in the project root directory and configure the MCP servers you need
2. Fetch MCP Gateway access token

```shell
mise run mcp-gateway-token
```
