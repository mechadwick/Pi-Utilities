echo "Syncing Google Drive Folders!"

cd /media/Google-Drive

echo "Syncing Aviation"
drive pull -quiet Aviation

echo "Syncing Companies"
drive pull -quiet Companies

echo "Syncing Current_Working"
drive pull -quiet Current_Working

echo "Syncing Games"
drive pull -quiet Games

echo "Syncing Photo_Backup"
drive pull -quiet Photo_Backup

echo "Syncing Records"
drive pull -quiet Records

echo "Syncing Sarah Documents"
drive pull -quiet "Sarah Documents"

echo "Syncing SchoolWork"
drive pull -quiet SchoolWork

echo "Syncing Tools"
drive pull -quiet Tools
