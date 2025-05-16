#!/usr/bin/env sh

set -xe

mkdir -p ./tmp
rm -rf ./tmp/*

ruby scripts/generate_openapi_json.rb

swift run swift-openapi-generator generate \
    --config ./openapi-generator-config.yaml \
    --output-directory Sources/SlackClient/Generated \
    ./tmp/openapi.json

rm -rf ./tmp
