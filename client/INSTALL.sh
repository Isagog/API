#! /bin/sh

OUTPUT_DIR="build"
VERSION="1.0.0"

if [ -e $OUTPUT_DIR ]
then
  rm -r $OUTPUT_DIR
fi

./generate_nlp_api_client.sh $OUTPUT_DIR $VERSION
./generate_ks_api_client.sh $OUTPUT_DIR $VERSION
./generate_dqa_api_client.sh $OUTPUT_DIR $VERSION
./generate_dm_api_client.sh $OUTPUT_DIR $VERSION

cd $OUTPUT_DIR
mvn clean install
cd ..
