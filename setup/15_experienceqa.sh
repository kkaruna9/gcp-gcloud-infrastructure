#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                   Setup & execute Experience QA                     |
+----------------------------------------------------------------------------+
"
export LANDING_ZONE_FUNCTIONAL="landing-zone-functional"
export LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH="temp/landing-zone-functional"
#gcloud source repos clone $LANDING_ZONE_FUNCTIONAL $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
npm run --prefix $LANDING_ZONE_FUNCTIONAL_QA_DEST_LOCAL_PATH experienceqa