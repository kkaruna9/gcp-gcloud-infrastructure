#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Hosting docker container for the reporting dashboard '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+

"
#kubectl run reporting-dashboard --image=karthiknarayanpdec11/reporting-dashboard:latest
#kubectl expose pod reporting-dashboard --port=3337 --target-port=3337 --name=reporting-dashboard --type=LoadBalancer
docker run --name reportingdashboard -p 3337:3337 --rm -i -t -d karthiknarayanpdec11/reporting-dashboard:latest
docker ps
docker images
kubectl get service
kubectl expose deployment reportingdashboard --name=reportingdashboard-service --type=LoadBalancer --port 3337 --target-port 3337
kubectl get service