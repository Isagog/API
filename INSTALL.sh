#! /bin/sh

OUTPUT_DIR="build"

if [ -e $OUTPUT_DIR ]
then
  rm -r $OUTPUT_DIR
fi

./generate_nlp_api_client.sh $OUTPUT_DIR
./generate_ks_api_client.sh $OUTPUT_DIR
./generate_dqa_api_client.sh $OUTPUT_DIR

cd $OUTPUT_DIR
mvn clean install
cd ..
