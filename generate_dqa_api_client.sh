#! /bin/sh

if [ $# -ne 1 ]
then
    echo "Required 1 argument: <output_dir>"
    exit
fi

OUTPUT_DIR=$1

openapi-generator generate \
 -i isagog-dqa.yaml \
 -g java \
 -o $OUTPUT_DIR \
 --group-id com.isagog \
 --artifact-id api \
 --api-package com.isagog.api.dqa \
 --model-package com.isagog.api.model
