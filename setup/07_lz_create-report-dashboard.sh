#!/bin/bash
echo "
+---------------------------------------------------------------------------------+
|           Hosting docker container for the reporting dashboard                  |
|                 (This will take approx. 2 minutes.)                             |
+---------------------------------------------------------------------------------+
"
#kubectl run reporting-dashboard --image=karthiknarayanpdec11/reporting-dashboard:latest
#kubectl expose pod reporting-dashboard --port=3337 --target-port=3337 --name=reporting-dashboard --type=LoadBalancer
#docker run --name reportingdashboard -p 3337:3337 --rm -i -t -d karthiknarayanpdec11/dashboardgcp:latest
#docker ps
#docker images
#kubectl get service
#kubectl expose deployment reportingdashboard --name=reportingdashboard-service --type=LoadBalancer --port 3337 --target-port 3337
gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_SERVER --zone $DEFAULT_ZONE_SERVER --project $PROJECT_ID
#kubectl create namespace $KUBECTL_RDASHBAORD
#kubectl get namespace
#kubectl run $KUBECTL_RDASHBAORD --image=karthiknarayanpdec11/reporting-dashboard:latest --namespace=$KUBECTL_RDASHBAORD
#kubectl expose pod $KUBECTL_RDASHBAORD --port=3337 --target-port=3337 --name=$KUBECTL_RDASHBAORD --namespace=$KUBECTL_RDASHBAORD --type=LoadBalancer

kubectl run $KUBECTL_RDASHBAORD --image=karthiknarayanpdec11/dashboardgcp:latest
kubectl expose pod $KUBECTL_RDASHBAORD --port=3337 --target-port=3337 --name=$KUBECTL_RDASHBAORD --type=LoadBalancer

bash -c external_dashboardip="";
while [ -z $external_dashboardip ];
do echo "Please Wait - Dashboard is Loading...";
external_dashboardip=$(kubectl get svc $KUBECTL_RDASHBAORD --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$external_dashboardip" ] && sleep 15; done; echo "End point ready-" && echo $external_dashboardip; export endpoint=external_dashboardip
