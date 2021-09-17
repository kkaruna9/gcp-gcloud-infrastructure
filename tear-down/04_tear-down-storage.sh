
echo "<<<<<<<<<<<<<<<<<<<< Tear Down: GCP Bucket Storages >>>>>>>>>>>>>>>>>>>>>>>>>>"
gsutil rm -r gs://$DEFAULT_BUCKET_REPORTS_DEST
if [ $? -eq 0 ]
then
  echo "Deleted Storage bucket  '$DEFAULT_BUCKET_REPORTS_DEST"
else
  echo "Failed to Delete Storage bucket '$DEFAULT_BUCKET_REPORTS_DEST"
fi