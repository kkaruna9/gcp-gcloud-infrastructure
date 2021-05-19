#!/bin/bash
echo "
+----------------------------------------------------------------------------+
| Creating and Spinning up SonarQube Cluster '$LZ_PROJECT_ID '.                       |
+----------------------------------------------------------------------------+

"
gcloud auth configure-docker
export CLUSTER=sonarqube-cluster
export ZONE=us-west1-a
gcloud container clusters create $CLUSTER --zone $ZONE
gcloud container clusters get-credentials $CLUSTER --zone $ZONE
git clone --recursive https://github.com/GoogleCloudPlatform/click-to-deploy.git
kubectl apply -f "https://raw.githubusercontent.com/GoogleCloudPlatform/marketplace-k8s-app-tools/master/crd/app-crd.yaml"
cd click-to-deploy/k8s/sonarqube
export APP_INSTANCE_NAME=sonarqube-1
export NAMESPACE=default
export DEFAULT_STORAGE_CLASS="standard" # provide your StorageClass name if not "standard"
export SONARQUBE_PERSISTENT_DISK_SIZE="10Gi"
export DB_PERSISTENT_DISK_SIZE="10Gi"
export TAG="gcr.io/cloud-marketplace/google/sonarqube@sha256:f646789063328926892c157f293a9a7e132572abdbea951cb6c35d99680cba57"
export TAG="7.7"
export IMAGE_SONARQUBE="marketplace.gcr.io/google/sonarqube"
export IMAGE_POSTGRESQL="marketplace.gcr.io/google/sonarqube/postgresql:$TAG"
export IMAGE_POSTGRESQL_EXPORTER="marketplace.gcr.io/google/sonarqube/postgresql-exporter:$TAG"
export IMAGE_METRICS_EXPORTER="marketplace.gcr.io/google/sonarqube/prometheus-to-sd:$TAG"
export POSTGRESQL_DB_PASSWORD=$(openssl rand 9 | openssl base64 -A | openssl base64)
export METRICS_EXPORTER_ENABLED=false
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /tmp/tls.key \
    -out /tmp/tls.crt \
    -subj "/CN=postgresql/O=postgresql"
export TLS_CERTIFICATE_KEY="$(cat /tmp/tls.key | base64)"
export TLS_CERTIFICATE_CRT="$(cat /tmp/tls.crt | base64)"
helm template "$APP_INSTANCE_NAME" chart/sonarqube \
  --namespace "$NAMESPACE" \
  --set sonarqube.image.repo="$IMAGE_SONARQUBE" \
  --set sonarqube.image.tag="$TAG" \
  --set sonarqube.persistence.size="$SONARQUBE_PERSISTENT_DISK_SIZE" \
  --set sonarqube.persistence.storageClass="$DEFAULT_STORAGE_CLASS" \
  --set postgresql.image="$IMAGE_POSTGRESQL" \
  --set postgresql.exporter.image="$IMAGE_POSTGRESQL_EXPORTER" \
  --set postgresql.db.password="$POSTGRESQL_DB_PASSWORD" \
  --set postgresql.persistence.size="$DB_PERSISTENT_DISK_SIZE" \
  --set metrics.image="$IMAGE_METRICS_EXPORTER" \
  --set metrics.exporter.enabled="$METRICS_EXPORTER_ENABLED" \
  --set tls.base64EncodedPrivateKey="$TLS_CERTIFICATE_KEY" \
  --set tls.base64EncodedCertificate="$TLS_CERTIFICATE_CRT" \
  > "${APP_INSTANCE_NAME}_manifest.yaml"
kubectl apply -f "${APP_INSTANCE_NAME}_manifest.yaml" --namespace "${NAMESPACE}"
echo "https://console.cloud.google.com/kubernetes/application/${ZONE}/${CLUSTER}/${NAMESPACE}/${APP_INSTANCE_NAME}"
kubectl port-forward --namespace $NAMESPACE svc/$APP_INSTANCE_NAME-sonarqube-svc 9000:9000
kubectl port-forward --namespace $default svc/$sonarqube-1-sonarqube-svc 9000:9000