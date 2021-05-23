#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| GCP Landing | SonarQube Installation |
+----------------------------------------------------------------------------+

"
export SONAR_NAME="sonarqube-3"
export PROJECT_ID=$(gclµoud config get-value project)
gcloud container clusters get-credentials spinnaker-ci-cd --zone us-east1-c --project $PROJECT_ID
kubectl create -n sonarqube
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo spinnaker
helm repo update
helm install --namespace sonarqube $SONAR_NAME --set service.type=LoadBalancer stable/sonarqube
sleep 20
export SERVICE_IP=$(kubectl -n sonarqube get svc $SONAR_NAME-sonarqube -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo http://$SERVICE_IP:9000
