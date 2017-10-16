#!/bin/bash

set -e

source $(dirname $0)/helpers.sh

it_can_deploy_release_to_folder_without_pom() {

  local src=$(mktemp -d $TMPDIR/out-src.XXXXXX)
  mkdir $src/m2-release

  local url=file://$src/m2-release
  local version=1.0.0-rc.0

  deploy_without_pom_without_credentials $url $version $src | jq -e "
    .version == {version: $(echo $version | jq -R .)}
  "
}

run it_can_deploy_release_to_folder_without_pom

