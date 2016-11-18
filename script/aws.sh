#!/bin/bash -eux

curl https://bootstrap.pypa.io/get-pip.py | python

pip install awscli
pip install awsebcli
