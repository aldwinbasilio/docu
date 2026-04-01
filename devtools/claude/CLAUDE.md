# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains Claude Code configuration and tooling for use with Google Cloud Vertex AI at Asurion. It manages MCP (Model Context Protocol) server connections, custom skills, and environment setup for Claude Code.

## Prerequisites

- Access to `gen-ai-preview` GCP project and `MCP Gateway`
- `gcloud-cli` installed and authenticated
- `mise` for tool/environment management
- Python 3 (managed via mise)

## Setup

```shell
mise install                              # Install tools from mise.toml
python3 -m pip install -r requirements.txt # Install Python MCP server dependencies
mise run mcp-gateway-token                # Fetch/refresh MCP Gateway access token (interactive)
```

## Project Structure

- `mise.toml` — Tool versions and environment variables (Vertex AI config, model selection, GCP credentials)
- `config.json` — MCP server credentials and connection config (contains secrets, do not commit changes)
- `config.example.json` — Template for config.json
- `scripts/mcp-gateway-token.sh` — Refreshes MCP Gateway bearer token in `.vscode/mcp.json`
- `scripts/generate-mcp-config.sh` — MCP config generator (stub)
- `skills/` — Custom Claude Code skill definitions (e.g., hcom-customer-correspondence, hcom-dynatrace-dashboard)
- `agents/` — Custom agent definitions (empty, placeholder)
- `mcp/` — MCP server configurations (empty, placeholder)

## Key Configuration

Claude Code is configured to use **Vertex AI** (`CLAUDE_CODE_USE_VERTEX=1`) with the `gen-ai-preview` GCP project. Models are pinned in `mise.toml`:

- Default model: `claude-opus-4-6`
- Fast model: `claude-haiku-4-5@20251001`
- Region: `global`

## Important Notes

- The MCP Gateway token expires periodically; run `mise run mcp-gateway-token` to refresh it.
- The `NODE_EXTRA_CA_CERTS` env var in `mise.toml` points to a local root CA cert for corporate proxy/TLS inspection.
