#!/usr/bin/env bash
# S.STUDIO Agent Office — Pixel Art Office for Hermes, OpenClaw, and ChatGPT
#
# Usage: ./start.sh [--port 3100] [--host 127.0.0.1]
#
# Requirements:
#   - Node.js 22+
#   - npm install && npm run build (first time only)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Parse args
PORT=3100
HOST="127.0.0.1"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --port|-p) PORT="$2"; shift 2 ;;
    --host) HOST="$2"; shift 2 ;;
    --help) echo "Usage: ./start.sh [--port 3100] [--host 127.0.0.1]"; exit 0 ;;
    *) echo "Unknown: $1"; exit 1 ;;
  esac
done

echo "🏢 S.STUDIO Agent Office"
echo "━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Characters: Hermes, OpenClaw, ChatGPT"
echo "  Server:     http://$HOST:$PORT"
echo ""

# Run the Pixel Agents CLI with our custom build
node dist/cli.js --port "$PORT" --host "$HOST"
