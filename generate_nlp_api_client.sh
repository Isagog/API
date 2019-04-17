#! /bin/sh

if [ $# -ne 1 ]
then
    echo "Required 1 argument: <output_dir>"
    exit
fi

OUTPUT_DIR=$1

wget https://raw.githubusercontent.com/KotlinNLP/NLPServer/api-doc-simple/openapi.yaml -O isagog-nlp.yaml

openapi-generator generate \
 -i isagog-nlp.yaml \
 -g java \
 -o $OUTPUT_DIR \
 --group-id com.isagog \
 --artifact-id api \
 --api-package com.isagog.api.nlp \
 --model-package com.isagog.api.model
