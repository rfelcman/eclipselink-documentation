#!/bin/bash

export JPA_DOC_INPUT_PATH=../webSite/documentation/3.0/jpa/extensions
export JPA_DOC_OUTPUT_PATH=docs.tmp/jpa/extensions

rm -rf ${JPA_DOC_OUTPUT_PATH}/*

#Example call
#pandoc -f html -t asciidoc -o /toc.adoc ../webSite/documentation/3.0/jpa/extensions/toc.htm

for f in $(ls ${JPA_DOC_INPUT_PATH} | grep .htm);
do
  echo Processing ${JPA_DOC_INPUT_PATH}/${f} ;
  output_filename=$(echo "$f" | cut -f 1 -d '.')
  pandoc -f html -t asciidoc -o ${JPA_DOC_OUTPUT_PATH}/${output_filename}.adoc ${JPA_DOC_INPUT_PATH}/${f}
done;