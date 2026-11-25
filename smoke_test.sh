#!/bin/sh
URL="${1:-http://localhost:5000}"
echo "Smoke test on $URL"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL/health")
if [ "$STATUS" = "200" ]; then
  echo "SMOKE TEST: PASSED"
  exit 0
else
  echo "SMOKE TEST: FAILED (HTTP $STATUS)"
  exit 1
fi