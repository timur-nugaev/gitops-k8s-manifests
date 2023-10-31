SERVICE_NAME=$1
BRANCH_NAME=`git branch --show-current`

if [ -z "$SERVICE_NAME" ]
then
    echo "service name is required"
    exit 1
fi

tkn -n $BRANCH_NAME pipelinerun list | grep build-$SERVICE_NAME | grep Running | awk '{print $1}' | xargs tkn -n $BRANCH_NAME pipelinerun logs -f