#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                       Setup & execute Post-Build QA                         |
+----------------------------------------------------------------------------+
"

#export POST_BUILD_FRONTEND_QA=$LZ_REPOPREFIX-gcp-frontend
#export PRE_BUILD_FRONTEND_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-gcp-frontend
export PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-landing-zone-pre-buildQA

#gcloud source repos clone $POST_BUILD_FRONTEND_QA $PRE_BUILD_FRONTEND_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
#source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/deploy-services-frontend-to-gke.sh
source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/gcp-postbuild-script.sh


#export LANDING_ZONE_FUNCTIONAL=$LZ_REPOPREFIX-landing-zone-functional
#export LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-landing-zone-functional
#gcloud source repos clone $LANDING_ZONE_FUNCTIONAL $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
#npm run --prefix $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH smokeTest
