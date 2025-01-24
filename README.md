# kubernetes-and-argo

Qual o objetivo deste repositório? 

* Estudar
    * Primeira etapa
        * Como subir um cluster Kubernetes?
        * Como automatizar o CD com o Argo?
    * Segunda etapa
        * Como monitorar o Cluster?
            * Quantidade de pacotes com destino aos pods.
            * Quantidade de bytes (networking I/O)
            * Como disponibilizar um mapa dos serviços no cluster


## Serviços

* Kubernetes -> Kind
* Prometheus
* Grafana
* App's
    * PHP
    * Go
    * Python


## Comandos 

```bash
## Cria o cluster
make create/cluster

## deleta o cluster
make delete/cluster

## Configura o nginx ingress controller
make apply.kube.nginx.ingress

## Lista todos os recursos em um namespace, neste caso ingress-nginx
kubectl get all -n ingress-nginx


## Adicionando o argo ao cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

## Reinstalando o argo 
kubectl replace --force -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

## Recuperando a senha do usuário admin do argo
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```


## References

* Kind (Cluster Kubernetes in Docker)
    * https://kind.sigs.k8s.io/docs/user/quick-start
* ArgoCd
    * https://github.com/argoproj/argo-cd
* Helm
    * https://helm.sh/docs/intro/install
