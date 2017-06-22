# disable-xenvm-offload
Script to disable all offload settings for a given VM.

Some guest OS in XenServer does not play well with NIC offloading.
Use this script in the XenServer console to disable all offload settings for a given VM.
A reboot of the VM is required after the script has run to activate the altered settings.

Examples of guest OS'es that might need this is:
* FreeBSD
* Citrix SD-WAN

Usage:
dis_xenvm_offload.sh [VMNAME].

ex.
dis_xenvm_offload.sh mybsd01
