#!/bin/bash

SERVICE_NAME=$1
NAMESPACE=$2
BRANCH_NAME=`git branch --show-current`

if [ -z "$NAMESPACE" ]
then
    echo "dddd"
    NAMESPACE=$BRANCH_NAME
fi

echo $NAMESPACE

if [ -z "$SERVICE_NAME" ]
then
    echo "service name is required"
    exit 1
fi

sed -e "s|BRANCH_NAME|$BRANCH_NAME|g" \
  -e "s|SERVICE_NAME|$SERVICE_NAME|g" \
  ./build/service-build-pipeline-run.template \
  | kubectl -n $NAMESPACE create -f - \
  | cut -d '/' -f 2 | cut -d ' ' -f 1 | xargs tkn -n $NAMESPACE pipelinerun logs -f  


