NAMESPACE_MANIFESTS := namespace.yaml
WEB_MANIFESTS := web-ingress.yaml
WEB2_MANIFESTS := web2-ingress.yaml
INGRESS_CLASS_MANIFEST := ingress-class.yaml

apply-namespaces:
	kubectl apply -f $(NAMESPACE_MANIFESTS)

apply-ingress-class: apply-namespaces
	kubectl apply -f $(INGRESS_CLASS_MANIFEST)

apply-deployments: apply-ingress-class
	kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0 -n web
	kubectl create deployment web2 --image=gcr.io/google-samples/hello-app:2.0 -n web2

apply-service: apply-deployments
	kubectl expose deployment web --type=NodePort --port=8080 -n web
	kubectl expose deployment web2 --type=NodePort --port=8080 -n web2

apply-ingress: apply-service
	kubectl apply -f $(WEB_MANIFESTS)
	kubectl apply -f $(WEB2_MANIFESTS)

deploy: apply-namespaces apply-ingress-class apply-deployments apply-service apply-ingress
	@echo "All manifests applied successfully!"

