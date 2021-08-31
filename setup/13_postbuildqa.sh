
#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                       Setup & execute Post-Build QA                         |
+----------------------------------------------------------------------------+
"

export POST_BUILD_FRONTEND_QA="gcp-frontend"
export PRE_BUILD_FRONTEND_QA_DEST_LOCAL_PATH="temp/gcp-frontend"
export PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH="temp/landing-zone-pre-buildQA"

gcloud source repos clone $POST_BUILD_FRONTEND_QA $PRE_BUILD_FRONTEND_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
#source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/deploy-services-frontend-to-gke.sh
source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/gcp-postbuild-script.sh


export LANDING_ZONE_FUNCTIONAL="landing-zone-functional"
export LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH="temp/landing-zone-functional"
gcloud source repos clone $LANDING_ZONE_FUNCTIONAL $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
npm run --prefix $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH smokeTest
