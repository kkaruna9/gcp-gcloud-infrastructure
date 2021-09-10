#!/bin/sh
echo "
+-----------------------------------------------------------------------------------------+
|             Runtime Environments Variables configuration & Database Creation            |
|                         (This will take approx. 1 minute.)                              |
+-----------------------------------------------------------------------------------------+
"

# -------- gcloud config variables for default keys

gcloud beta runtime-config configs create $DEFAULT_CONFIG_NAME --description "Global config that hold major key value pairs"
gcloud beta runtime-config configs variables set DEFAULT_REGION $DEFAULT_REGION --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_ZONE $DEFAULT_ZONE --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set PROJECT_ID $PROJECT_ID --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set BUCKET_ID $BUCKET_ID --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_SERVER --zone $DEFAULT_ZONE --project $PROJECT_ID
gcloud beta runtime-config configs variables set DEFAULT_CLUSTER_QEA_SERVER $DEFAULT_CLUSTER_QEA_SERVER --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DASHBOARD_REPO $DASHBOARD_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
#DEFAULT_SONAR_IP=$(kubectl get svc $KUBECTL_SONARQUBE --namespace=$KUBECTL_SONARQUBE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
DEFAULT_SONAR_IP=$(kubectl get svc $KUBECTL_SONARQUBE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
DEFAULT_GRID_IP=$(kubectl get svc $KUBECTL_GRID_RELEASE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
#DEFAULT_GRID_IP=$(kubectl get svc $KUBECTL_GRID_RELEASE --namespace=$KUBECTL_GRID --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
#DEFAULT_DASHBOARD_IP=$(kubectl get svc $KUBECTL_RDASHBAORD --namespace=$KUBECTL_RDASHBAORD --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
DEFAULT_DASHBOARD_IP=$(kubectl get svc $KUBECTL_RDASHBAORD --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_APP --zone $DEFAULT_ZONE --project $PROJECT_ID
gcloud beta runtime-config configs variables set FRONTEND_REPO $FRONTEND_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set BACKEND_REPO $BACKEND_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set FUNCTIONAL_REPO $FUNCTIONAL_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set PERFORMANCE_REPO $PERFORMANCE_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set SECURITY_REPO $SECURITY_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set ACCESSIBILITY_REPO $ACCESSIBILITY_REPO --config-name $DEFAULT_CONFIG_NAME --is-text
DEFAULT_MSSQL_IP=$(kubectl get svc $KUBECTL_MSSQL --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
#gcloud container clusters get-credentials $DEFAULT_CLUSTER_QEA_CICD --zone $DEFAULT_ZONE --project $PROJECT_ID
#gcloud beta runtime-config configs variables set DEFAULT_CLUSTER_APP $DEFAULT_CLUSTER_APP --config-name $DEFAULT_CONFIG_NAME --is-text
# --------gcloud kubernetes set environment variables values for Server Instances
gcloud beta runtime-config configs variables set DEFAULT_SONAR_IP $DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_GRID_IP $DEFAULT_GRID_IP --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_MSSQL_IP $DEFAULT_MSSQL_IP --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_DASHBOARD_IP $DEFAULT_DASHBOARD_IP --config-name $DEFAULT_CONFIG_NAME --is-text

node gcp-gcloud-infrastructure/setup/11_mssql-connect.js

echo " GCP Workshop - Infrastructure Setup Checklist"
echo " -------------------------------------------------------------"
echo "GCP Workshop Storage Bucket Name      = "$BUCKET_ID
echo "GCP Workshop Quality Gate Server IP   = "$DEFAULT_SONAR_IP
echo "GCP Workshop MsSQL Database Server IP = "$DEFAULT_MSSQL_IP
echo "GCP Workshop Reporting Dashboard IP   = "$DEFAULT_DASHBOARD_IP
echo "GCP Workshop Grid Server IP           = "$DEFAULT_GRID_IP
echo "GCP Workshop Repository Creations     = COMPLETED"
echo "GCP Workshop Database Creation        = COMPLETED"
echo "GCP Workshop Global Variables Setup   = COMPLETED"
echo "GCP Workshop Two Cluster Creation     = COMPLETED"
echo "GCP Workshop Environment Setup        = COMPLETED"
echo "GCP Workshop Environment Setup        = COMPLETED"
echo " -------------------------------------------------------------"


curl --location --request POST 'http://'"${DEFAULT_DASHBOARD_IP}"':3337/api/v1/gcp_dashboard_report/secrets/updatelandingzone' --header 'Content-Type: application/json' --data-raw '{
    "seleniumgridIP": "'$DEFAULT_GRID_IP'",
     "projectName": "'$(gcloud config get-value project)'",
     "sonarqubeIP": "'$DEFAULT_SONAR_IP'",
     "organizationName": "'$BUCKET_ID'"
}'
#gcloud container clusters get-credentials $DEFAULT_CLUSTER_APP --zone $DEFAULT_ZONE --project $PROJECT_ID
#DEFAULT_APPLICATION_HOST=$(kubectl get svc $KUBECTL_FRONTEND_APP --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
#echo "DEFAULT_APPLICATION_HOST = "$DEFAULT_APPLICATION_HOST
#DEFAULT_API_HOST=$(kubectl get svc $KUBECTL_FRONTEND_APP --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
#echo "DEFAULT_API_HOST = "$DEFAULT_API_HOST
#gcloud beta runtime-config configs variables set DEFAULT_APPLICATION_HOST $DEFAULT_APPLICATION_HOST --config-name $DEFAULT_CONFIG_NAME --is-text
#gcloud beta runtime-config configs variables set DEFAULT_API_HOST $DEFAULT_API_HOST --config-name $DEFAULT_CONFIG_NAME --is-text

# --------gcloud config get runtime variables values
#gcloud beta runtime-config configs variables get-value DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables unset DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables get-value DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables get-value DEFAULT_GRID_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables get-value DEFAULT_MSSQL_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables get-value DEFAULT_DASHBOARD_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables get-value DEFAULT_APPLICATION_HOST --config-name $DEFAULT_CONFIG_NAME



