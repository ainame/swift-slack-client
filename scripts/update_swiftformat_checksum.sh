#!/usr/bin/env bash

set -euo pipefail

package_file="${1:-Package.swift}"

url="$(
    perl -0ne '
        if (/name:\s*"swiftformat",\s*url:\s*"([^"]+)"/s) {
            print $1;
        } else {
            exit 1;
        }
    ' "$package_file"
)"

tmpdir="$(mktemp -d)"
archive_path="$tmpdir/swiftformat.artifactbundle.zip"
trap 'rm -rf "$tmpdir"' EXIT

curl --fail --location --silent --show-error "$url" --output "$archive_path"

checksum="$(swift package compute-checksum "$archive_path")"

CHECKSUM="$checksum" perl -0pi -e 's@(^\s*checksum:\s*")[0-9a-f]+(")@$1 . $ENV{CHECKSUM} . $2@me' "$package_file"
