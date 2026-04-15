#!/bin/bash

set -x

ssh-keygen -t rsa -b 4096 -f ~/.ssh/doug_anson_azure_cli_ssh_rsa
chmod 600 ~/.ssh/*
cat ~/.ssh/doug_anson_azure_cli_ssh_rsa.pub
