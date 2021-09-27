#!/bin/sh
echo "
+----------------------------------------------------------------------------+
|                   GCP Initial Project Setup                                |
+----------------------------------------------------------------------------+
"
: '
echo -n "Do you want to create a new project (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    read -p "Project Name :" PROJECT_NAME

    gcloud projects create $PROJECT_NAME --set-as-default
    gcloud config set project $PROJECT_NAME
else
    red=`tput setaf 1`
    echo  $red ALERT ! If default project exist and it will be choosen, else please re-start to create a new project
fi

echo -n "Create a service account with owner role (y/n)? "
read san
if [ "$san" != "${san#[Yy]}" ] ;then
    read -p "Enter Service Account Name :" SA_NAME
    userEmail=$(gcloud auth list --format="value(account)")
    gcloud iam service-accounts create $SA_NAME --display-name="My Service Account"
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

'
projectCreation(){
  PROJECT_NAME="gcp-digital-shopify"$(shuf -i 1-100000 -n 1)
  SA_NAME="sa-shopify"
  gcloud projects create $PROJECT_NAME --set-as-default
  gcloud config set project $PROJECT_NAME
  gcloud iam service-accounts create $SA_NAME --display-name="Digital Shopify ServiceAccount"
  PROJECT_ID=$(gcloud config get-value project)
  gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com" --role="roles/owner"
  #gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com" --role="roles/cloudbuild.builds.builder"
#gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@cloudbuild.gserviceaccount.com --role=roles/container.developer"
#gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@cloudbuild.gserviceaccount.com --role=roles/kubernetes.engine.admin"
#gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@cloudbuild.gserviceaccount.com --role=roles/storage.admin"
}

if gcloud projects list --format="value(PROJECT_ID)" | grep -q 'qea-sandbox'; then
  echo ">>>>>>> PROJECT_ID QEA-Sandbox Exist"
  gcloud config set project qea-sandbox
else
  echo ">>>>>>> PROJECT_ID QEA-Sandbox Doesnt Exist"
  projectCreation
fi

userEmail=$(gcloud auth list --format="value(account)")
PROJECT_NUMBER=$(gcloud projects describe ${PROJECT_ID} --format='get(projectNumber)')
export SERVICE_ACCOUNT=$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com"
gcloud iam service-accounts keys create $PROJECT_ID.json --iam-account=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
mv $PROJECT_ID.json temp
export SA_NAME=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS="temp/"$PROJECT_ID.json
CURRENT_BILLING_ACCOUNT_ID=$(gcloud beta billing accounts list --format="value(name)")
gcloud alpha billing accounts projects link $PROJECT_ID --billing-account=$CURRENT_BILLING_ACCOUNT_ID

export GIT_USERNAME
export GIT_USEREMAIL=$(gcloud auth list --format="value(account)")
read -p 'Git Global User Name :' GIT_USERNAME
#read -p 'Git Global User Email :' GIT_USEREMAIL
git config --global -e user.email $GIT_USEREMAIL
git config --global user.name $GIT_USERNAME






