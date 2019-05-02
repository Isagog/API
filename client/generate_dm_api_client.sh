#! /bin/sh

if [ $# -ne 2 ]
then
    echo "Required 2 arguments: <output_dir> <artifact_version>"
    exit
fi

OUTPUT_DIR=$1
VERSION=$2

openapi-generator generate \
 --skip-validate-spec \
 -i isagog-dm.yaml \
 -g java \
 -o $OUTPUT_DIR \
 --group-id com.isagog \
 --artifact-id api \
 --artifact-version $VERSION \
 --api-package com.isagog.api.dm \
 --model-package com.isagog.api.dm.model
