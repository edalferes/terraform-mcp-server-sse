#!/bin/sh
set -e

echo "⚙️ Starting stdio → SSE: serving terraform-mcp-server as SSE"
exec supergateway \
  --stdio "/opt/supergateway/terraform-mcp-server stdio" \
  --port "${PORT:-8000}" \
  --baseUrl "http://0.0.0.0:${PORT:-8000}" \
  --ssePath "${SSE_PATH:-/sse}" \
  --messagePath "${MESSAGE_PATH:-/message}" \
  --cors \
  --logLevel "${LOG_LEVEL:-info}"