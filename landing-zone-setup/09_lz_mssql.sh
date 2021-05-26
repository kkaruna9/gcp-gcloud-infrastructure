


kubectl apply -f  "temp/gcp-gcloud-infrastructure/landing-zone-setup/mssql.yml"
bash -c external_ip="";
while [ -z $external_ip ];
do echo "Please Wait Loading...";
external_ip=$(kubectl get svc mssql-container --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}");
[ -z "$external_ip" ] && sleep 10; done; echo "End point ready-" && echo $external_ip; export endpoint=$external_ip