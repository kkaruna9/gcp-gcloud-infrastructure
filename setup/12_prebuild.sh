
#!/bin/bash
echo "
+----------------------------------------------------------------------------+
|                       Setup & execute Pre-Build QA                         |
+----------------------------------------------------------------------------+
"

#gcloud source repos clone gcp-backend --project=qea-sandbox
#gcloud source repos clone landing-zone-pre-buildQA --project=qea-sandbox
#sh landing-zone-pre-buildQA/create_triggers_in_cloud_build.sh
#sh landing-zone-pre-buildQA/run-bvt-with-mock-services.sh


#export PRE_BUILD_BACKEND_QA=$LZ_REPOPREFIX-gcp-backend
#export PRE_BUILD_LANDINGZONE_QA=$LZ_REPOPREFIX-landing-zone-pre-buildQA

#export PRE_BUILD_BACKEND_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-gcp-backend
export PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH=temp/$LZ_REPOPREFIX-landing-zone-pre-buildQA


#gcloud source repos clone $PRE_BUILD_BACKEND_QA $PRE_BUILD_BACKEND_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
gcloud source repos clone $PRE_BUILD_LANDINGZONE_QA $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH --project=$PROJECT_ID
#source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/create_triggers_in_cloud_build.sh
source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/gcp-prebuild-script.sh
#source $PRE_BUILD_LANDINGZONE_QA_DEST_LOCAL_PATH/run-bvt-with-mock-services.sh

