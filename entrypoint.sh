#!/bin/bash
set -e

rm -f /carepi2/tmp/pids/server.pid

exec "$@"
