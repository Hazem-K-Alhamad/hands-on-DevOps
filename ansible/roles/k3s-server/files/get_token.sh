#!/bin/bash

# Copyright (C) 2019 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# Outputs the vagrant user's token needed to access the Kubernetes Dashboard.

SECRET=$(kubectl -n kube-system get secret | grep vagrant | awk '{print $1}')
TOKEN=$(kubectl -n kube-system get secret $SECRET -o jsonpath='{.data.token}' | base64 --decode)
echo $TOKEN


