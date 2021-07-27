# tech-assignment

## Prerequisites
Terraform
AZ Cli
kubectl

#### WORKSPACE
azure_aks_uks: Azure AKS cluster
azure_data_uks: AKS cluster Add-ons and Helm Charts

### Preparation
```
export WORKSPACE=
export TF_STATE_STORAGE_ACCOUNT=
export TF_STATE_RESOURCE_GROUP=
export TF_STATE_CONTAINER=
```

#### Deploy AKS
```
make TF_ACTION=plan azure_aks
make TF_ACTION=apply azure_aks
```

#### Deploy Cluster apps
```
make TF_ACTION=plan data
make TF_ACTION=apply data
```

#### Destroy Resources
```
make TF_ACTION=destroy data
make TF_ACTION=destroy azure_aks
```
