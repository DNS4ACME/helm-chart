#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

cd $SCRIPT_DIR/../dns4acme
helm install dns4acme --namespace dns4acme . --values $SCRIPT_DIR/values.yaml
helm test --namespace dns4acme example.com
