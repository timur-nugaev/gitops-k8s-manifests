#!/bin/bash

NEW_BRANCH_NAME=$1
BASE_CONFIGURATION=$2
SOURCE_BRANCH_NAME=$3


if [ -z "$NEW_BRANCH_NAME" ]
then
    echo "new branch name is required"
    exit 1
fi

if [ -z "$BASE_CONFIGURATION" ]
then
    BASE_CONFIGURATION=dev
fi

if [ -z "$SOURCE_BRANCH_NAME" ]
then
    SOURCE_BRANCH_NAME=dev
fi

sed -e "s|NEW_BRANCH_NAME|$NEW_BRANCH_NAME|g" \
  -e "s|BASE_CONFIGURATION|$BASE_CONFIGURATION|g" \
  -e "s|SOURCE_BRANCH_NAME|$SOURCE_BRANCH_NAME|g" ./build/new-branch-pipeline-run.template \
  | kubectl -n build create -f - \
  | cut -d '/' -f 2 | cut -d ' ' -f 1 | xargs tkn -n build pipelinerun logs -f  


