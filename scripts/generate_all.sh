#!/usr/bin/env sh

set -xe

OUTPUT_DIR="Sources/SlackClient/WebAPI/Generated"
TMP_DIR="./tmp"

mkdir -p ./tmp/WebAPI
mkdir -p ./tmp/Events

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

# Generate types with public and client with internal to avoid potential conflict other symbols named `Client`
swift run swift-openapi-generator generate \
    --mode types \
    --access-modifier public \
    --naming-strategy idiomatic \
    --output-directory "${TMP_DIR}/WebAPI" \
    "${TMP_DIR}/WebAPI/openapi.json"

swift run swift-openapi-generator generate \
    --mode client \
    --access-modifier internal \
    --naming-strategy idiomatic \
    --output-directory "${TMP_DIR}/WebAPI" \
    "${TMP_DIR}/WebAPI/openapi.json"

ruby scripts/process_generated_code.rb "${TMP_DIR}/WebAPI" "${OUTPUT_DIR}"

# Generate events
ruby scripts/generate_events.rb

swift run swift-openapi-generator generate \
    --mode types \
    --access-modifier public \
    --naming-strategy idiomatic \
    --output-directory "${TMP_DIR}/Events" \
    "${TMP_DIR}/Events/openapi.json"
