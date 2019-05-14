#!/usr/bin/env bash
set -e
. ./ops/env.sh
helm template helm/$APP_NAME -f helm/$APP_NAME/values.yaml
