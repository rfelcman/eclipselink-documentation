#!/bin/bash

export JPA_DOC_INPUT_PATH=../webSite/documentation/4.0/jpa/extensions
export JPA_DOC_OUTPUT_PATH=docs.tmp/jpa/extensions
mkdir -p ${JPA_DOC_OUTPUT_PATH}
rm -rf ${JPA_DOC_OUTPUT_PATH}/*

export CONCEPTS_DOC_INPUT_PATH=../webSite/documentation/4.0/concepts
export CONCEPTS_DOC_OUTPUT_PATH=docs.tmp/concepts
mkdir -p ${CONCEPTS_DOC_OUTPUT_PATH}
rm -rf ${CONCEPTS_DOC_OUTPUT_PATH}/*

export SOLUTIONS_DOC_INPUT_PATH=../webSite/documentation/4.0/solutions
export SOLUTIONS_DOC_OUTPUT_PATH=docs.tmp/solutions
mkdir -p ${SOLUTIONS_DOC_OUTPUT_PATH}
rm -rf ${SOLUTIONS_DOC_OUTPUT_PATH}/*

export MOXY_DOC_INPUT_PATH=../webSite/documentation/4.0/moxy
export MOXY_DOC_OUTPUT_PATH=docs.tmp/moxy
mkdir -p ${MOXY_DOC_OUTPUT_PATH}
rm -rf ${MOXY_DOC_OUTPUT_PATH}/*

export DBWS_DOC_INPUT_PATH=../webSite/documentation/4.0/dbws/img_text
export DBWS_DOC_OUTPUT_PATH=docs.tmp/dbws
mkdir -p ${DBWS_DOC_OUTPUT_PATH}
rm -rf ${DBWS_DOC_OUTPUT_PATH}/*

# Convert documents from input directory to some output directory.
# Arguments:
#  $1 - Input directory
#  $2 - Output directory
convert_documents() {
  local DOC_INPUT_PATH=${1}
  local DOC_OUTPUT_PATH=${2}
  for f in $(ls ${DOC_INPUT_PATH} | grep .htm);
  do
    echo Processing ${DOC_INPUT_PATH}/${f} ;
    output_filename=$(echo "$f" | cut -f 1 -d '.')
    pandoc -f html -t asciidoc -o ${DOC_OUTPUT_PATH}/${output_filename}.adoc ${DOC_INPUT_PATH}/${f}
  done;
}

#convert_documents ${JPA_DOC_INPUT_PATH} ${JPA_DOC_OUTPUT_PATH}
#convert_documents ${CONCEPTS_DOC_INPUT_PATH} ${CONCEPTS_DOC_OUTPUT_PATH}
#convert_documents ${SOLUTIONS_DOC_INPUT_PATH} ${SOLUTIONS_DOC_OUTPUT_PATH}
#convert_documents ${MOXY_DOC_INPUT_PATH} ${MOXY_DOC_OUTPUT_PATH}
convert_documents ${DBWS_DOC_INPUT_PATH} ${DBWS_DOC_OUTPUT_PATH}




#Example call
#pandoc -f html -t asciidoc -o /toc.adoc ../webSite/documentation/3.0/jpa/extensions/toc.htm
