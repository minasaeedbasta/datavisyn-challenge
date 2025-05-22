#!/bin/bash

# Update the Helm repositories
helm dependency update ../

# Install ArgoCD using the Helm chart
helm install argocd ../  -f ../values.yaml -n argocd --create-namespace
