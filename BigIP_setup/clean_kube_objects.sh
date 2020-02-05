#!/bin/bash

if [ $# -ne 1 ] ; then
        echo "usage: $0 kube_partition"
        exit 1
fi

tmsh -c " cd /$1/ ; delete ltm virtual all"
tmsh delete ltm rule /$1/http_redirect_irule
tmsh delete ltm data-group internal /$1/https_redirect_dg
