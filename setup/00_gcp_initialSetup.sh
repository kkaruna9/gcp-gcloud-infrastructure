#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   GCP Initial Project Setup                            |
+----------------------------------------------------------------------------+
"
echo -n "Do you want to create a new project (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    read -p 'Project Name :' PROJECT_NAME
    gcloud projects create $PROJECT_NAME --set-as-default
    gcloud config set project $PROJECT_NAME
else
    red=`tput setaf 1`
    echo  $red ALERT ! If default project exist and it will be choosen, else please re-start to create a new project
fi

echo -n "Create a service account with owner role (y/n)? "
read san
if [ "$san" != "${san#[Yy]}" ] ;then
    read -p 'Enter Service Account Name :' SA_NAME
    gcloud iam service-accounts create $SA_NAME
    PROJECT_ID=$(gcloud config get-value project)
    gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com" --role="roles/owner"
    gcloud iam service-accounts keys create $PROJECT_ID.json --iam-account=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
    mv $PROJECT_ID.json temp
    export SA_NAME=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
    export GOOGLE_APPLICATION_CREDENTIALS="temp/"$PROJECT_ID.json
else
    red=`tput setaf 1`
    echo  $red ALERT !  Service Account setup is done by user Manually
fi







