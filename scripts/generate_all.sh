#!/usr/bin/env sh

set -xe

TMP_DIR="./.tmp"

mkdir -p "${TMP_DIR}/WebAPI"
mkdir -p "${TMP_DIR}/Events"

if [ ! -d "${TMP_DIR}/java-slack-sdk/.git" ]; then
    git clone --depth 1 https://github.com/slackapi/java-slack-sdk.git "${TMP_DIR}/java-slack-sdk"
else
    echo "java-slack-sdk repository already exists at ./tmp/java-slack-sdk. Skipping clone."
fi

if [ ! -d "${TMP_DIR}/slack-api-ref/.git" ]; then
    git clone --depth 1 https://github.com/slack-ruby/slack-api-ref.git "${TMP_DIR}/slack-api-ref"
else
    echo "slack-api-ref repository already exists at ./tmp/slack-api-ref. Skipping clone."
fi

ruby scripts/generate_webapi.rb

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

ruby scripts/process_webapi.rb "${TMP_DIR}/WebAPI" "Sources/SlackClient/WebAPI/Generated"

# Generate events
ruby scripts/generate_events.rb

swift run swift-openapi-generator generate \
    --mode types \
    --access-modifier public \
    --naming-strategy idiomatic \
    --output-directory "${TMP_DIR}/Events" \
    "${TMP_DIR}/Events/openapi.json"

ruby scripts/process_events.rb "${TMP_DIR}/Events/Types.swift" "Sources/SlackClient/Events/Generated"
