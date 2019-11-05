#! /bin/sh

set -e

OUTPUT_DIR="build"
VERSION="2.0.0"

if [ -e $OUTPUT_DIR ]
then
  rm -r $OUTPUT_DIR
fi

./generate_nlp_api_client.sh $OUTPUT_DIR $VERSION
./generate_ks_api_client.sh $OUTPUT_DIR $VERSION
./generate_dqa_api_client.sh $OUTPUT_DIR $VERSION
./generate_faq_api_client.sh $OUTPUT_DIR $VERSION
./generate_dm_api_client.sh $OUTPUT_DIR $VERSION

JSON_JAVA_FILE="$OUTPUT_DIR/src/main/java/com/isagog/api/JSON.java"
DISCRIMINATOR_TMP_FILE="$OUTPUT_DIR/discriminators.tmp"
DISCRIMINATOR_IMPORT_TMP_FILE="$OUTPUT_DIR/discriminator_imports.tmp"

python replace_discriminator_registration.py $JSON_JAVA_FILE $DISCRIMINATOR_TMP_FILE
python replace_discriminator_imports.py $JSON_JAVA_FILE $DISCRIMINATOR_IMPORT_TMP_FILE

cd $OUTPUT_DIR
mvn clean install
cd ..
