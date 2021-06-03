
#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   Environment variables configuration                            |
+----------------------------------------------------------------------------+
"

DEFAULT_SONAR_IP=$(kubectl get svc $KUBECTL_SONARQUBE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_SONAR_IP = "$DEFAULT_SONAR_IP

DEFAULT_GRID_IP=$(kubectl get svc $KUBECTL_GRID --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_GRID_IP = "$DEFAULT_GRID_IP

DEFAULT_MSSQL_IP=$(kubectl get svc $KUBECTL_MSSQL --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_MSSQL_IP = "$DEFAULT_MSSQL_IP

DEFAULT_DASHBOARD_IP=$(kubectl get svc KUBECTL_RDASHBAORD --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
echo "DEFAULT_SONAR_IP = "$DEFAULT_DASHBOARD_IP"
