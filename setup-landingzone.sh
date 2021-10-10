#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   GCP - OneShot - Infrastructure Setup                     |
+----------------------------------------------------------------------------+
"
export execution_starttime=$(date +"%T")
{
  source temp/gcp-gcloud-infrastructure/setup/00_gcp_initialSetup.sh
  source temp/gcp-gcloud-infrastructure/setup/01_gcp_services.sh
  source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh
  echo store:
  {
    source temp/gcp-gcloud-infrastructure/setup/03_lz_create-repo.sh &
    source temp/gcp-gcloud-infrastructure/setup/07_lz_create-bucket.sh
    wait
  }
  echo heart:
  {
    source temp/gcp-gcloud-infrastructure/setup/04_lz_create_kubectl_clusters.sh &
    source temp/gcp-gcloud-infrastructure/setup/06_vm_setup.sh
    wait
  }
  echo connect:
  {
    source temp/gcp-gcloud-infrastructure/setup/08_lz_mssql.sh &
    source temp/gcp-gcloud-infrastructure/setup/05_push_source2workshop.sh
    wait
  }
  source temp/gcp-gcloud-infrastructure/setup/09_setConfig.sh
}
export execution_endtime=$(date +"%T")

echo "LandlingZone Script Execution Start time : "$execution_starttime
echo "LandlingZone Script Execution End time : "$execution_endtime

