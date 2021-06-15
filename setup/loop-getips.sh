#!/bin/sh



export KUBECTL_SONARQUBE="sonarqube"
export KUBECTL_GRID="zalenium"
export KUBECTL_GRID_RELEASE="release-zalenium"
export KUBECTL_MSSQL="mssql-container"
export KUBECTL_RDASHBAORD="reporting-dashboard"

bash -c z_external_ip="";
while [ -z $z_external_ip ];
do echo "Please Wait release-zalenium Loading...";
z_external_ip=$(kubectl get svc release-zalenium --namespace=$KUBECTL_GRID --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$z_external_ip" ] && sleep 10; done; echo "End point ready-" && echo $z_external_ip; export z_endpoint=$z_external_ip


bash -c r_external_ip="";
while [ -z $r_external_ip ];
do echo "Please Wait '$KUBECTL_RDASHBAORD' Loading...";
r_external_ip=$(kubectl get svc $KUBECTL_RDASHBAORD --namespace=$KUBECTL_RDASHBAORD --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$r_external_ip" ] && sleep 15; done; echo "End point ready-" && echo $r_external_ip; export r_endpoint=$r_external_ip


bash -c m_external_ip="";
while [ -z $m_external_ip ];
do echo "Please Wait mssql-container Loading...";
m_external_ip=$(kubectl get svc $KUBECTL_MSSQL --namespace=$KUBECTL_MSSQL --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$m_external_ip" ] && sleep 15; done; echo "End point ready-" && echo $m_external_ip; export m_endpoint=$m_external_ip

bash -c s_external_ip="";
while [ -z $s_external_ip ];
do echo "Please Wait '$KUBECTL_SONARQUBE' Loading...";
s_external_ip=$(kubectl get svc $KUBECTL_SONARQUBE --namespace=$KUBECTL_SONARQUBE --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$s_external_ip" ] && sleep 15; done; echo "End point ready-" && echo $s_external_ip; export s_endpoint=$s_external_ip

source temp/gcp-gcloud-infrastructure/setup/10_setConfig.sh
node temp/gcp-gcloud-infrastructure/setup/11_mssql-connect.js