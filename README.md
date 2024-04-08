# iac-helm-analytics-workspace-management
Helm Chart for LSCSDE workspace management components

https://github.com/lsc-sde/docker-analytics-workspace-mgmt

## Installing
To install this locally, please use the following command: 
```bash
helm repo add lsc-sde https://lsc-sde.github.io/iac-helm-repository/
helm upgrade --install -n lscsde-workspace-mgr --create-namespace analytics-workspace-management lsc-sde/analytics-workspace-management
```

This will install the CRD's and will install the management portal along with the service account and permissions to manage them

## Developer Guide
This helm release will be called by the [Analytics Workspace Management Flux Configuration](https://github.com/lsc-sde/iac-flux-analytics-workspace-management), this is called by [Core LSCSDE Helm Chart](https://github.com/lsc-sde/iac-helm-lscsde-flux), which in turn is called by the [Core LSCSDE Flux configuration](https://github.com/lsc-sde/iac-flux-lscsde)

When the main branch of this repository is created it will trigger a github action which will:
* Calculate a semver version number
* Create a release branch with the semver version
* Create the helm package and upload to https://github.com/lsc-sde/iac-helm-repository
* Update the submodules on the main repository
* Update the analytics_workspace_management_chart_version value on the core [lscsde flux configuration](https://github.com/lsc-sde/iac-flux-lscsde)

This will in turn trigger github actions that will propagate those changes up the chain