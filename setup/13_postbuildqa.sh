
#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                       Setup & execute Post-Build QA                         |
+----------------------------------------------------------------------------+
"

export POST_BUILD_FRONTEND_QA="gcp-frontend"
export POST_BUILD_FRONTEND_QA_DEST_LOCAL_PATH="temp/gcp-frontend"

gcloud source repos clone $POST_BUILD_FRONTEND_QA $POST_BUILD_FRONTEND_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
source $PRE_BUILD_LANDINGZONE_QA/deploy-services-frontend-to-gke.sh


export LANDING_ZONE_FUNCTIONAL="landing-zone-functional"
export LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH="temp/landing-zone-functional"
gcloud source repos clone $LANDING_ZONE_FUNCTIONAL $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
npm run --prefix $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH ${"smokeTest"}
