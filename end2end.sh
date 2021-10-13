#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   GCP - OneShot - End to End Setup                         |
+----------------------------------------------------------------------------+
"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh
export PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-landing-zone-pre-buildQA
source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/gcp-e2e-script.sh