#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")/.."
mkdir -p data
if curl -fsS http://127.0.0.1:8770/healthz >/dev/null 2>&1; then exit 0; fi
nohup env FORWARDED_ALLOW_IPS= .venv/bin/python app.py >data/server.log 2>&1 </dev/null &
