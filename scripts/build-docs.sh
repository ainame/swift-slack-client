#!/bin/bash

set -euxo pipefail

TMP_DIR=".tmp"
HOSTING_BASE_PATH="swift-slack-client"
OUTPUT_DIR="docs/${HOSTING_BASE_PATH}"

rm -rf "${TMP_DIR}/*.doccarchive"
rm -rf "$OUTPUT_DIR"
mkdir -p "${OUTPUT_DIR}"
mkdir -p "${TMP_DIR}"

swift package --allow-writing-to-directory "${TMP_DIR}" \
    generate-documentation \
    --output-path "${TMP_DIR}" \
    --product SlackClient \
    --product SlackBlockKit \
    --product SlackBlockKitDSL \
    --product SlackModels \
    --disable-indexing \
    --transform-for-static-hosting \
    --source-service github \
    --source-service-base-url https://github.com/ainame/swift-slack-client/blob/main \
    --checkout-path "$(pwd)" \
    --hosting-base-path "${HOSTING_BASE_PATH}"

docc merge "${TMP_DIR}"/*.doccarchive --output-path "${OUTPUT_DIR}"
