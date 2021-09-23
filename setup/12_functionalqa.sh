#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                   Setup & execute functional assurance                     |
+----------------------------------------------------------------------------+
"
source temp/gcp-gcloud-infrastructure/setup/02_lz_environment-variables.sh
export LANDING_ZONE_FUNCTIONAL=$LZ_REPOPREFIX-landing-zone-functional
export LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-landing-zone-functional
gcloud source repos clone $LANDING_ZONE_FUNCTIONAL $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
npm run --prefix $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH functional