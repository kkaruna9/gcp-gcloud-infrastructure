#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| SonarQube Install & SPIN                                                   |
+----------------------------------------------------------------------------+

"

# gcloud container clusters get-credentials spinnaker-ci-cd --zone us-east1-c --project $PROJECT_ID
gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA --zone $DEFAULT_ZONE --project $PROJECT_ID
kubectl create namespace $KUBECTL_SONARQUBE
kubectl run $KUBECTL_SONARQUBE --image=sonarqube:7.5-community  --requests='cpu=0.75,memory=1250Mi'
kubectl expose pod $KUBECTL_SONARQUBE --port=6002 --target-port=9000 --name=$KUBECTL_SONARQUBE --type=LoadBalancer







#helm repo add stable https://charts.helm.sh/stable
#helm repo add bitnami https://charts.bitnami.com/bitnami
#helm search repo spinnaker
#helm repo update
#helm install --namespace $KUBECTL_SONARQUBE $SONAR_NAME --set service.type=LoadBalancer stable/sonarqube
#sleep 20
#export SERVICE_IP=$(kubectl -n $KUBECTL_SONARQUBE get svc $SONAR_NAME-sonarqube -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
#echo http://$SERVICE_IP:9000
