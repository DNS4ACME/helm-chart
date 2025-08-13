#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

cd $SCRIPT_DIR/../dns4acme
echo "Running helm install..."
helm install dns4acme --namespace dns4acme . --values $SCRIPT_DIR/values.yaml

echo "Running helm test..."
helm test --namespace dns4acme dns4acme
