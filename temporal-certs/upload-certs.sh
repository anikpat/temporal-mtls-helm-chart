#!/bin/bash

certs=("temporal-ca" "temporal-cluster" "temporal-client")
cd certs

for cert in "${certs[@]}"; do
    if [ -f "$cert.pem" ]; then
        kubectl delete secret "$cert" --ignore-not-found
        kubectl create secret tls "${cert}" --key "${cert}.key" --cert "${cert}.pem"
    elif [ -f "$cert.cert" ]; then
        kubectl delete secret "$cert" --ignore-not-found
        kubectl create secret tls $cert --key "${cert}.key" --cert "${cert}.cert"
    else
        echo "No cert found for $cert"
    fi
done