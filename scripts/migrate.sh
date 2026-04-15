#!/bin/sh

if [ -z "$1" ]; then
    echo "Usage: $0 <local_db_name>"
    exit 1
fi

DB=$1
LOCAL_ADMIN="admin"
VM_ADMIN_USER="admin"
echo "Migrating local DB: ${DB} to Cloud..."

# Create the Cloud VM
echo "Creating Cloud VM..."
SSH_CMD=`echo "yes\n" | ./scripts/create_vm.sh | grep ssh_command | sed 's/\"/ /g' | sed 's/\@/ /g'`
VM_IP_ADDRESS=`echo ${SSH_CMD} | awk '{print $17}'`
echo "Cloud VM created."

# Backup our DB
echo "Backing up the local DB ${DB}..."
mysqldump -u ${LOCAL_ADMIN} -p --routines --triggers --events --databases ${DB} | gzip > ${DB}.sql.gz

# Restore the DB in the Cloud VM
echo "Restoring local DB ${DB} onto the Cloud VM: Admin: ${VM_ADMIN_USER} IP: ${VM_IP_ADDRESS}"
echo "You will need to open a second window and ssh into the VM and then look in /root for the password"
gunzip -c ${DB}.sql.gz | mysql -h ${VM_IP_ADDRESS} -u ${VM_ADMIN_USER} -p
