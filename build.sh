#!/bin/bash

set -exuo pipefail

LINSTOR_PY_VERSION=v1.13.0
LINSTOR_CLIENT_VERSION="$LINSTOR_PY_VERSION"

sudo apt install -y debhelper dh-python bash-completion docbook-xsl help2man python3-all python3-setuptools xsltproc

git clone --recursive https://github.com/LINBIT/linstor-api-py
git checkout "$LINSTOR_PY_VERSION"

cd linstor-api-py

debuild -i -us -uc -b

cd ..

git clone --recursive  https://github.com/LINBIT/linstor-client

cd linstor-client
debuild -i -us -uc -b
