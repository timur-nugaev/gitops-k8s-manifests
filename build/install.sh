# kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
# kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

# kubectl apply -n build -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-cli/0.4/git-cli.yaml
# kubectl apply -n build -f https://api.hub.tekton.dev/v1/resource/tekton/task/kubernetes-actions/0.2/

kubectl apply -f build-rbac.yaml