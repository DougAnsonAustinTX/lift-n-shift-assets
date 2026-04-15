#!/bin/bash

set -x
mkdir tf-test && cd tf-test
terraform init
cd ..
rm -r tf-test
