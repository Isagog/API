#! /bin/sh

set -e

if [ $# -ne 2 ]
then
    echo "Required 2 arguments: <output_dir> <artifact_version>"
    exit
fi

OUTPUT_DIR=$1
VERSION=$2

JAVA_POST_PROCESS_FILE="/usr/local/bin/clang-format -i"

openapi-generator generate \
 -i ../isagog-dqa.yaml \
 -g java \
 -o $OUTPUT_DIR \
 --group-id com.isagog \
 --artifact-id api \
 --artifact-version $VERSION \
 --api-package com.isagog.api.dqa \
 --model-package com.isagog.api.model
