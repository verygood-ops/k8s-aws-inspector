#!/usr/bin/env bash
unset APP_VERSION
unset NS_NAME
unset DOCKER_TAG
export APP_VERSION=`grep -i "tag:" helm/*/values.yaml | awk '{print $2}'`
export NS_NAME=`grep -i "namespace" helm/*/values.yaml | cut -d" " -f2`
export DOCKER_TAG=${DOCKER_TAG:-"quay.io/verygoodsecurity/$APP_NAME:$APP_VERSION"}
