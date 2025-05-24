# MCP Gateway Docker (stdio → SSE) - Terraform MCP Server

This Docker setup wraps the `terraform-mcp-server` (which communicates via `stdio`) with **supergateway**, exposing it as an HTTP SSE endpoint that can be consumed by tools.

## 📦 Files in this project

### `Dockerfile`

Builds a Docker image using:

- `supercorp/supergateway:2.8.3` as base
- Downloads `terraform-mcp-server` version 0.1.0
- Installs `curl` and `unzip`
- Copies `entrypoint.sh` that starts the gateway

### `entrypoint.sh`

Shell script that starts `supergateway` in one of two modes:

- **stdio → SSE**: expose the MCP server locally via HTTP/SSE
- **SSE → stdio**: connect to an external SSE endpoint (e.g. an n8n workflow) and forward messages to `terraform-mcp-server`

### `docker-compose.yml`

Defines two services:

- `mcp-gateway`: builds and runs the MCP gateway container
- `n8n`: (optional) runs an n8n instance for testing/integration

---

## 🚀 Quick Start

1. **Clone or copy** this project to your machine.
2. Ensure `docker` and `docker-compose` are installed.
3. Build and run:

```bash
docker compose up --build