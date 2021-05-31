#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Delete Kubernetes services                                                 |
+----------------------------------------------------------------------------+

"

#kubectl delete all --all --all-namespaces
kubectl delete namespaces $KUBECTL_SONARQUBE
kubectl delete namespaces $KUBECTL_GRID
kubectl delete namespaces $KUBECTL_RDASHBAORD
