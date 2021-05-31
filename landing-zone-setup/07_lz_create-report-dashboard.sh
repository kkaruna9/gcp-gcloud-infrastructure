#!/bin/bash
echo "
+---------------------------------------------------------------------------------+
| Hosting docker container for the reporting dashboard in project'$PROJECT_ID '.  |
+---------------------------------------------------------------------------------+
"
#kubectl run reporting-dashboard --image=karthiknarayanpdec11/reporting-dashboard:latest
#kubectl expose pod reporting-dashboard --port=3337 --target-port=3337 --name=reporting-dashboard --type=LoadBalancer
#docker run --name reportingdashboard -p 3337:3337 --rm -i -t -d karthiknarayanpdec11/reporting-dashboard:latest
#docker ps
#docker images
#kubectl get service
#kubectl expose deployment reportingdashboard --name=reportingdashboard-service --type=LoadBalancer --port 3337 --target-port 3337
gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA --zone $DEFAULT_ZONE --project $PROJECT_ID
kubectl create namespace $KUBECTL_RDASHBAORD
kubectl run $KUBECTL_RDASHBAORD --image=karthiknarayanpdec11/reporting-dashboard:latest
kubectl expose pod $KUBECTL_RDASHBAORD --port=3337 --target-port=3337 --name=$KUBECTL_RDASHBAORD --type=LoadBalancer
kubectl get service