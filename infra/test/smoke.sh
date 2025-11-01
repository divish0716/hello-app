#!/usr/bin/env bash
set -eu

# 기본값: 호스트 127.0.0.1, 포트 80
HOST="${1:-127.0.0.1}"
PORT="${2:-80}"
RETRIES=10
SLEEP=1

echoinfo() { echo "[INFO] $*"; }
echoerr() { echo "[ERROR] $*" >&2; }

echoinfo "Starting smoke test: checking $HOST:$PORT"

i=0
while [ $i -lt "$RETRIES" ]; do
    # TCP 연결 테스트
    if (echo > /dev/tcp/$HOST/$PORT) >/dev/null 2>&1; then
        echoinfo "Port $PORT is open on $HOST. Smoke test passed!"
        exit 0
    else
        echoinfo "Waiting for $HOST:$PORT to open... ($((i+1))/$RETRIES)"
        i=$((i+1))
        sleep $SLEEP
    fi
done

echoerr "FAILED: $HOST:$PORT is not open after $((RETRIES*SLEEP))s"
exit 1