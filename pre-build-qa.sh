#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                       Setup & execute Pre-Build QA                         |
+----------------------------------------------------------------------------+
"
gcloud source repos clone $PRE_BUILD_QA $PRE_BUILD_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
source $PRE_BUILD_QA_DEST_LOCAL_PATH/create_triggers_in_cloud_build.sh
source $PRE_BUILD_QA_DEST_LOCAL_PATH/deploy-services-frontend-to-gke.sh