#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   GCP - OneShot - Infrastructure Setup                     |
+----------------------------------------------------------------------------+
"
rm -rf temp/
mkdir temp && cd temp && git clone https://github.com/dinesh-akrishnan/gcp-gcloud-infrastructure.git && cd ..
source temp/gcp-gcloud-infrastructure/setup/00_lz_environment-variables.sh
source temp/gcp-gcloud-infrastructure/setup/01_lz_create_kubectl_clusters.sh
export LZ_REPOPREFIX="lz-repo-3"
source temp/gcp-gcloud-infrastructure/setup/02_lz_create-repo.sh
source temp/gcp-gcloud-infrastructure/setup/03_lz_create-bucket.sh
source temp/gcp-gcloud-infrastructure/setup/04_push_source2workshop.sh
source temp/gcp-gcloud-infrastructure/setup/05_lz_spin_grid_server.sh
source temp/gcp-gcloud-infrastructure/setup/06_lz_create_container_registry.sh
source temp/gcp-gcloud-infrastructure/setup/07_lz_create-report-dashboard.sh
source temp/gcp-gcloud-infrastructure/setup/08_lz_mssql.sh
source temp/gcp-gcloud-infrastructure/setup/09_lz_sonarQube.sh

