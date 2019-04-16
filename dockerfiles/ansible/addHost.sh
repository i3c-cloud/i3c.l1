#!/bin/bash
if [ "x$1" == "x" ]; then
    echo "Usage: /addHost [accSecretKey] [host]";
    exit;
fi
if [ "x$2" == "x" ]; then
    echo "Usage: /addHost [accSecretKey] [host]";
    exit;
fi
if [ ! -e /run/secrets/sshKeys/$1 ]; then
    echo "File /run/secrets/sshKeys/$1 not found";
    exit;
fi

cat ~/.ssh/id_rsa.pub | ssh -i /run/secrets/sshKeys/$1 ansible@$2 'cat >> .ssh/authorized_keys && echo "Key copied"'