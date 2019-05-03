#! /bin/sh

if [ $# -ne 2 ]
then
    echo "Required 2 arguments: <output_dir> <artifact_version>"
    exit
fi

OUTPUT_DIR=$1
VERSION=$2

JAVA_POST_PROCESS_FILE="/usr/local/bin/clang-format -i"

openapi-generator generate \
 --skip-validate-spec \
 -i ../isagog-dm.yaml \
 -g java \
 -o $OUTPUT_DIR \
 --group-id com.isagog \
 --artifact-id api \
 --artifact-version $VERSION \
 --api-package com.isagog.api.dm \
 --model-package com.isagog.api.dm.model

JSON_JAVA_FILE="$OUTPUT_DIR/src/main/java/com/isagog/api/JSON.java"
DISCRIMINATOR_TMP_FILE="$OUTPUT_DIR/discriminators.tmp"
DISCRIMINATOR_IMPORT_TMP_FILE="$OUTPUT_DIR/discriminator_imports.tmp"

python print_discriminator_registration.py $JSON_JAVA_FILE >> $DISCRIMINATOR_TMP_FILE
grep "import com.isagog.api..*" $JSON_JAVA_FILE >> $DISCRIMINATOR_IMPORT_TMP_FILE
