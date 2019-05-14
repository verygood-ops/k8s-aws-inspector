#!/usr/bin/env bash
set -e
. ./ops/env.sh
helm package ./helm/$APP_NAME/ -d ./charts
helm repo index ./charts