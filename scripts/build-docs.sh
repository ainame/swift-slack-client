#!/bin/bash

set -euxo pipefail

TMP_DIR=".tmp"
OUTPUT_DIR="docs"

mkdir -p "${OUTPUT_DIR}"
mkdir -p "${TMP_DIR}"
rm -rf "${TMP_DIR}/*.doccarchive"
rm -rf "$OUTPUT_DIR"

swift package --allow-writing-to-directory "${TMP_DIR}" \
    generate-documentation \
    --output-path "${TMP_DIR}" \
    --product SlackClient \
    --product SlackBlockKit \
    --product SlackBlockKitDSL \
    --product SlackModels \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path swift-slack-client \
    --source-service github \
    --source-service-base-url https://github.com/ainame/swift-slack-client/blob/main \
    --checkout-path "$(pwd)"

docc merge "${TMP_DIR}"/*.doccarchive --output-path "${OUTPUT_DIR}"
