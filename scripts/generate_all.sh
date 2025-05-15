#!/usr/bin/env sh

set -xe

ruby scripts/generate_openapi_json.rb

swift run swift-openapi-generator generate \
    --mode types \
    --mode client \
    --access-modifier public \
    --output-directory Sources/SlackClient/Generated \
    Sources/SlackClient/openapi.json

rm Sources/SlackClient/openapi.json
