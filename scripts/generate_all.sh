#!/usr/bin/env sh

set -xe

mkdir -p ./tmp
rm -rf ./tmp/*


if [ ! -d "./tmp/java-slack-sdk/.git" ]; then
    git clone --depth 1 https://github.com/slackapi/java-slack-sdk.git tmp/java-slack-sdk
else
    echo "java-slack-sdk repository already exists at ./tmp/java-slack-sdk. Skipping clone."
fi

if [ ! -d "./tmp/slack-api-ref/.git" ]; then
    git clone --depth 1 https://github.com/slack-ruby/slack-api-ref.git tmp/slack-api-ref
else
    echo "slack-api-ref repository already exists at ./tmp/slack-api-ref. Skipping clone."
fi

ruby scripts/generate_openapi_json.rb

swift run swift-openapi-generator generate \
    --config ./openapi-generator-config.yaml \
    --output-directory Sources/SlackClient/Generated \
    ./tmp/openapi.json

rm -rf ./tmp
