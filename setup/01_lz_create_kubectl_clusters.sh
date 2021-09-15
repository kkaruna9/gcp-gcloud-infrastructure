#!/bin/bash

echo "
+----------------------------------------------------------------------------+
|               Creating Kubernetes clusters for the workshop                |
+----------------------------------------------------------------------------+
"
gcloud container --project $PROJECT_ID clusters create $DEFAULT_CLUSTER_QEA_SERVER --zone $DEFAULT_ZONE_SERVER --no-enable-basic-auth --cluster-version $DEFAULT_CLUSTER_VERSION --release-channel "stable" --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "20" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "4" --max-nodes 4 --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/"$PROJECT_ID"/global/networks/default" --subnetwork "projects/"$PROJECT_ID"/regions/us-central1/subnetworks/default" --default-max-pods-per-node "110" --enable-autoprovisioning --min-cpu "1" --min-memory "64" --max-cpu "20" --max-memory "256" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 &
gcloud container --project $PROJECT_ID clusters create $DEFAULT_CLUSTER_QEA_APP --zone $DEFAULT_ZONE_APP --no-enable-basic-auth --cluster-version $DEFAULT_CLUSTER_VERSION --release-channel "stable" --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "20" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "4" --max-nodes 4 --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/"$PROJECT_ID"/global/networks/default" --subnetwork "projects/"$PROJECT_ID"/regions/us-east1/subnetworks/default" --default-max-pods-per-node "110" --enable-autoprovisioning --min-cpu "1" --min-memory "64" --max-cpu "20" --max-memory "256" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 &
wait


#if [ "$PROJECT_ID" == "qea-sandbox" ];
#then

#gcloud container --project $PROJECT_ID clusters create $DEFAULT_CLUSTER_QEA_CICD --zone $DEFAULT_ZONE --no-enable-basic-auth --cluster-version $DEFAULT_CLUSTER_VERSION --release-channel "stable" --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "4" --max-nodes 20 --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/"$PROJECT_ID"/global/networks/default" --subnetwork "projects/"$PROJECT_ID"/regions/us-central1/subnetworks/default" --default-max-pods-per-node "110" --enable-autoprovisioning --min-cpu "1" --min-memory "64" --max-cpu "20" --max-memory "256" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0
#if [ $? -eq 0 ]
#then
  #echo "Created Kubernetes '$DEFAULT_CLUSTER_QEA_CICD' Cluster"
#else
  #echo "Failed to create Kubernetes '$DEFAULT_CLUSTER_QEA_CICD' Cluster"
#fi
#gcloud container --project $PROJECT_ID clusters create $DEFAULT_CLUSTER_APP --zone $DEFAULT_ZONE --no-enable-basic-auth --cluster-version $DEFAULT_CLUSTER_VERSION --release-channel "regular" --machine-type "e2-medium" --image-type "COS" --disk-type "pd-standard" --disk-size "100" --metadata disable-legacy-endpoints=true --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --enable-stackdriver-kubernetes --enable-ip-alias --network "projects/"$PROJECT_ID"/global/networks/default" --subnetwork "projects/"$PROJECT_ID"/regions/us-central1/subnetworks/default" --default-max-pods-per-node "110" --enable-autoprovisioning --min-cpu "1" --min-memory "64" --max-cpu "10" --max-memory "128" --no-enable-master-authorized-networks --addons HorizontalPodAutoscaling,HttpLoadBalancing --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0
#if [ $? -eq 0 ]
#then
  #echo "Created Kubernetes '$DEFAULT_CLUSTER_APP' Cluster in the zone '$DEFAULT_ZONE' "
#else
  #echo "Failed to create Kubernetes '$DEFAULT_CLUSTER_APP' Cluster in the zone '$DEFAULT_ZONE'"
#fi