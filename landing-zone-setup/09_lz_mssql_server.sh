#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Zone Microsoft SQL Server Installation                                     |
+----------------------------------------------------------------------------+

"
#helm install --name mymssql stable/mssql-linux --set acceptEula.value=Y --set edition.value=Developer

helm repo update
helm install --set acceptEula.value=Y --set edition.value=Developer stable/mssql-linux --generate-name
printf $(kubectl get secret --namespace default mssql-linux-1621781957-secret -o jsonpath="{.data.sapassword}" | base64 --decode);echo
#Sou0U2rdylSLEJADHyOL
#kubectl run mssqlcli --image=microsoft/mssql-tools -ti --restart=Never --rm=true -- /bin/bash
#sqlcmd -S mssql-linux-1621781957.default,1433 -U sa
#Password:
