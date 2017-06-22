#!/bin/sh

#####################################################################
# Use this script in XenServer console to disable NIC offloading
# for a specific VM.
# Author: Max Lindqvist, max@toklan.com, 2017-07-22
#####################################################################

vm_uuid=`xe vm-list name-label=$1 params=uuid |cut -f 2 -d ':' |cut -b 2-`

echo VM UUID: $vm_uuid

if [ ! -z $vm_uuid ]; then

xe vif-list vm-uuid=$vm_uuid params=uuid |grep uuid |cut -f 2 -d ':' |cut -b 2- | while read line ; do

    echo    Disable TCP send offload settings for VIF UUID: $line

    xe vif-param-set uuid=$line other-config:ethtool-gso="off"
    xe vif-param-set uuid=$line other-config:ethtool-ufo="off"
    xe vif-param-set uuid=$line other-config:ethtool-tso="off"
    xe vif-param-set uuid=$line other-config:ethtool-sg="off"
    xe vif-param-set uuid=$line other-config:ethtool-tx="off"
    xe vif-param-set uuid=$line other-config:ethtool-rx="off"
    xe vif-param-set uuid=$line other-config:promiscuous="true"

done

fi
