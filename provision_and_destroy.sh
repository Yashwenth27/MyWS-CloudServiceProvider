#!/bin/bash
# Purpose: Demonstrates Rapid Elasticity by provisioning and destroying 3 VMs.
echo "--- STARTING RAPID ELASTICITY DEMO ---"
echo "Phase 1: Provisioning 3 VMs (Scale Out)"
for i in {1..3}
do
    VM_NAME="app-server-$i"
    echo "Provisioning $VM_NAME..."
    multipass launch --name $VM_NAME
    if [ $? -eq 0 ]; then
        echo "$VM_NAME launched successfully."
    else
        echo "ERROR: Failed to launch $VM_NAME."
    fi
done
echo "VM Provisioning Complete. Listing all active instances:"
multipass list
echo " "
echo "Sleeping for 15 seconds to simulate application runtime..."
sleep 15
echo " "
echo "Phase 2: De-provisioning 3 VMs (Scale In)"
for i in {1..3}
do
    VM_NAME="app-server-$i"
    echo "Stopping and destroying $VM_NAME..."
    multipass delete $VM_NAME --purge --confirm
    if [ $? -eq 0 ]; then
        echo "$VM_NAME destroyed successfully."
    else
        echo "ERROR: Failed to destroy $VM_NAME."
    fi
done
echo "De-provisioning Complete."
multipass list
echo "--- DEMO FINISHED ---"
