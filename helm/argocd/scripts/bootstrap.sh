#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CHART_DIR="${SCRIPT_DIR}/.."

# Update the Helm repositories
echo "Updating Helm dependencies..."
helm dependency update "${CHART_DIR}"

# Install ArgoCD using the Helm chart
echo "Installing ArgoCD..."
helm install argocd "${CHART_DIR}" \
  --namespace argocd \
  --create-namespace \
  -f "${CHART_DIR}/values.yaml"