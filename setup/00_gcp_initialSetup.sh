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
projectSetup(){
  RANNUM=$(shuf -i 1-100000 -n 1)
  echo -n "Do you want to create a new project (y/n)? "
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
     #echo -n "Are you sure to create a new project (y/n)? "
    #read sure
    #if [ "$sure" != "${sure#[Yy]}" ] ;then
      PROJECT_NAME="gcp-digital-shopify"$RANNUM
      gcloud projects create $PROJECT_NAME --set-as-default
      gcloud config set project $PROJECT_NAME
  #else
      #echo -n "User doesnt want to create a new project"
    #fi
  else
    gcloud projects list
    echo -n "Select the PROJECT_ID from existing list and assign, please "
    read -p "Project ID :" PROJECT_ID
    #gcloud projects create $PROJECT_NAME --set-as-default
    gcloud config set project $PROJECT_ID
    gcloud config set project $PROJECT_ID
  fi
}

#if gcloud projects list --format="value(PROJECT_ID)" | grep -q 'qea-sandbox'; then
  #echo ">>>>>>> PROJECT_ID QEA-Sandbox Exist"
  #gcloud config set project qea-sandbox
#else
  #echo ">>>>>>> PROJECT_ID QEA-Sandbox Doesnt Exist"
  #projectSetup
#fi

projectSetup
isSAExist=$(gcloud iam service-accounts list --format="value(email)" --filter="name ~ .*sa-shopify@qea-sandbox.iam.gserviceaccount.com.*")
if [ "sa-shopify@qea-sandbox.iam.gserviceaccount.com" != "$isSAExist" ] ;then
SA_NAME="sa-shopify"
gcloud iam service-accounts create $SA_NAME --display-name="Digital Shopify ServiceAccount"
else
echo ">>>>>>> SERVICE ACCOUNT Already Exist"
fi

PROJECT_ID=$(gcloud config get-value project)
#gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com" --role="roles/compute.instanceAdmin.v1"
#gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com" --role="roles/container.developer"
#gcloud iam roles create $RANNUM --project=${PROJECT_ID} --file=temp/gcp-gcloud-infrastructure/setup/computeInstance.yaml
PROJECT_NUM=$(gcloud projects list --filter="$PROJECT_ID" --format="value(PROJECT_NUMBER)" --project=$PROJECT_ID)
SERVICE_ACCOUNT=${PROJECT_NUM}@cloudbuild.gserviceaccount.com
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com" --role="roles/owner"
#gcloud iam roles create $PROJECT_NUM --project=${PROJECT_ID} --file=temp/gcp-gcloud-infrastructure/setup/computeInstance.yaml
#gcloud iam service-accounts create "gcp"$PROJECT_NUM"@cloudbuild.gserviceaccount.com" --display-name="Digital Shopify ServiceAccount"
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$PROJECT_NUM"@cloudbuild.gserviceaccount.com" --role="roles/compute.instanceAdmin.v1"
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$PROJECT_NUM"@cloudbuild.gserviceaccount.com" --role="roles/container.developer"
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:"$PROJECT_NUM"@cloudbuild.gserviceaccount.com" --role="roles/iam.serviceAccountUser"
userEmail=$(gcloud auth list --format="value(account)")
PROJECT_NUMBER=$(gcloud projects describe ${PROJECT_ID} --format='get(projectNumber)')
export SERVICE_ACCOUNT=$SA_NAME"@"$PROJECT_ID".iam.gserviceaccount.com"
gcloud iam service-accounts keys create $PROJECT_ID.json --iam-account=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
mv $PROJECT_ID.json temp
export SA_NAME=$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS="temp/"$PROJECT_ID.json

echo -n "GCP Workshop >> List of Billing Accounts"
gcloud beta billing accounts list --format="value(name)"


echo -n "Do you want to select by default first billing account from the list (y/n)? "
read bill
if [ "$bill" != "${bill#[Yy]}" ] ;then
CURRENT_BILLING_ACCOUNT_ID=$(gcloud beta billing accounts list --format="value(name)[1]")
gcloud alpha billing accounts projects link $PROJECT_ID --billing-account=$CURRENT_BILLING_ACCOUNT_ID
else
if [ "$PROJECT_ID" != "qea-sandbox" ] ;then
  CURRENT_BILLING_ACCOUNT_ID="017FA4-2FD087-C6F4E7"
  gcloud alpha billing accounts projects link $PROJECT_ID --billing-account=$CURRENT_BILLING_ACCOUNT_ID
else
  echo -n "Please copy & paste the billing account from above list : "
  read copyBill
  gcloud alpha billing accounts projects link $PROJECT_ID --billing-account=$copyBill
fi
fi

export GIT_USERNAME=gcp-digital-shopify
export GIT_USEREMAIL=$(gcloud auth list --format="value(account)")
git config --global user.email $GIT_USEREMAIL
git config --global user.name $GIT_USERNAME






