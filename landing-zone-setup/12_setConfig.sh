
#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   Runtime Enviornments Variables configuration             |
+----------------------------------------------------------------------------+
"

DEFAULT_SONAR_IP=$(kubectl get svc $KUBECTL_SONARQUBE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_SONAR_IP = "$DEFAULT_SONAR_IP

DEFAULT_GRID_IP=$(kubectl get svc $KUBECTL_GRID --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_GRID_IP = "$DEFAULT_GRID_IP

DEFAULT_MSSQL_IP=$(kubectl get svc $KUBECTL_MSSQL --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_MSSQL_IP = "$DEFAULT_MSSQL_IP

DEFAULT_DASHBOARD_IP=$(kubectl get svc KUBECTL_RDASHBAORD --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_SONAR_IP = "$DEFAULT_DASHBOARD_IP

gcloud runtime-config configs create $DEFAULT_CONFIG_NAME --description "Global config that hold major key value pairs"
gcloud beta runtime-config configs variables set DEFAULT_SONAR_IP $DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_GRID_IP $DEFAULT_GRID_IP --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_MSSQL_IP $DEFAULT_MSSQL_IP --config-name $DEFAULT_CONFIG_NAME --is-text
gcloud beta runtime-config configs variables set DEFAULT_DASHBOARD_IP $DEFAULT_DASHBOARD_IP --config-name $DEFAULT_CONFIG_NAME --is-text
#gcloud beta runtime-config configs variables get-value DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME
#gcloud beta runtime-config configs variables unset DEFAULT_SONAR_IP --config-name $DEFAULT_CONFIG_NAME
