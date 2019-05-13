#! /bin/sh

set -e

if [ $# -ne 2 ]
then
    echo "Required 2 arguments: <output_dir> <artifact_version>"
    exit
fi

OUTPUT_DIR=$1
VERSION=$2

export JAVA_POST_PROCESS_FILE="/usr/local/bin/clang-format -i"

openapi-generator generate \
 -i ../isagog-faq.yaml \
 -g java \
 -o $OUTPUT_DIR \
 --group-id com.isagog \
 --artifact-id api \
 --artifact-version $VERSION \
 --api-package com.isagog.api.faq \
 --model-package com.isagog.api.faq.model
