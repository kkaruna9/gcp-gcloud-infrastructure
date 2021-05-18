#!/bin/bash

echo "
+----------------------------------------------------------------------------+
| Creating and Spinning up Grid server for the workshop                 |
+----------------------------------------------------------------------------+
"

gcloud container --project $LZ_PROJECT_ID clusters create "zalenium" --zone "us-central1-c" --no-enable-basic-auth --cluster-version "1.19.9-gke.1400" --release-channel "regular" --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/"$LZ_PROJECT_ID"/global/networks/default" --subnetwork "projects/"$LZ_PROJECT_ID"/regions/us-central1/subnetworks/default" --default-max-pods-per-node "110" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0
gcloud container clusters get-credentials zalenium --zone us-central1-c --project $LZ_PROJECT_ID
kubectl create namespace zalenium
kubectl get namespace
helm repo add zalenium-github https://raw.githubusercontent.com/zalando/zalenium/master/charts/zalenium
helm search repo zalenium
helm install my-release1 --namespace zalenium zalenium-github/zalenium --set hub.serviceType="LoadBalancer" --set hub.basicAuth.enabled="true" --set hub.basicAuth.username="TechCoE" --set hub.basicAuth.password="TechCoE"
kubectl get service my-release1-zalenium --namespace="zalenium"

