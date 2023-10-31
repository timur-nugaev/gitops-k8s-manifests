SERVICE_NAME=$1
NAMESPACE=$2

if [ -z "$NAMESPACE" ]
then
    NAMESPACE=`git branch --show-current`
fi

if [ -z "$SERVICE_NAME" ]
then
    echo "service name is required"
    exit 1
fi

tkn -n $NAMESPACE pipelinerun list | grep build-$SERVICE_NAME | grep Running | awk '{print $1}' | xargs tkn -n $NAMESPACE pipelinerun logs -f