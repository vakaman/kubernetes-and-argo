project_name = kubernetes-and-argo

.PHONY: create/cluster 
create/cluster:
	kind create cluster --config kind-config.yaml

.PHONY: delete/cluster 
delete/cluster:
	kind delete cluster

.PHONY: apply.kube.nginx.ingress
apply.kube.nginx.ingress:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml


.PHONY: setup/cluster setup/add-label/worker setup/add-label/worker2
setup/cluster: apply.kube.nginx.ingress 
setup/add-label/worker: 
	kubectl label node kind-worker ingress-ready=true
setup/add-label/worker2: 
	kubectl label node kind-worker2 ingress-ready=true


.PHONY: apply.argo apply.argo.namespace apply.argo.helm

apply.argo: 
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	@echo "✅ Argo instalado."

