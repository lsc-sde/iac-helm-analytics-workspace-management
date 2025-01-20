---
title: AnalyticsWorkspaces
parent: Custom Resources
layout: page
grand_parent: Developer Guide
nav_order: 1
---

An analytics workspace defines all the elements of an analytics workspaces so that Kubernetes and JupyterHub can provision these workspaces as required.

## Custom Resource Definition
The Lancashire and South Cumbria Secure Data Environment (LSC-SDE) [Analytics Workspace Management Solution](../../Analytics-Workspace-Management-Solution.md) (AWMS) leverages [Kubernetes Custom Resource Definitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/) to store and manage workspaces

Example:
```yaml
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspace
metadata:
  name: example-workspace
  namespace: jupyterhub
spec:
  displayName: Example Workspace
  description: |-
    An example workspace I've created in order to facilitate testing of the management portal.

    There may be numerous of these on local environments.
  jupyterWorkspace:
    extraLabels:
      xlscsde.nhs.uk/test: IsTestWorkspace
    image: lscsde/datascience-notebook-default:0.1.0
    persistentVolumeClaim: {}
    resources:
      limits:
        cpu: 2
  validity:
    availableFrom: "2022-01-03"
    expires: "2030-01-07"
```

## Schema

### AnalyticsWorkspaceSpec

| Property | Description | Type | Required | Default Value |
| --- | --- | --- | --- | --- |
| displayName | The short display name used as the title for the workspace. | string | Yes | |
| description | A simple description which can be multiple lines describing the workspace | string | Yes | |
| validity | An object describing variables which are validated to ensure that the workspace is still valid | object | Yes | |
| validity.availableFrom | The date that the workspace is valid from (in open API date format) | string (date) | Yes | |
| validity.expires | The date that the workspace expires | string (date) | Yes | |
| virtualMachineWorkspace | This is not yet implemented, it is to test validation of the CRD is functioning correctly | AnalyticsWorkspaceVirtualMachine | No | None |
| jupyterWorkspace | Represents a jupyter workspace | AnalyticsWorkspaceJupyterWorkspace | Yes | None |

### AnalyticsWorkspaceVirtualMachine

| Property | Description | Type | Required | Default Value |
| --- | --- | --- | --- | --- |
| maxHosts | This is not yet implemented. The maximum number of hosts | string (or int) | No | |

### AnalyticsWorkspaceJupyterWorkspace

| Property | Description | Type | Required | Default Value |
| --- | --- | --- | --- | --- |
| image | The image used when provisioning the pod created by jupyter hub | string | Yes | |
| extraLabels | A map of labels to append to the pod created | dict(str, str) | No | None |
| defaultUri | The URI that jupyter will use when the items are provisioned. | string | No | None |
| nodeSelector | a map of node selector tags per the kubernetes documentation | dict(str, str) | No | None |
| tolerations | The pod's tolerations. [list(V1Toleration)](https://github.com/kubernetes-client/python/blob/master/kubernetes/docs/V1Toleration.md) | No | None |
| resources |  describes the compute resource requirements. | [V1ResourceRequirements](https://github.com/kubernetes-client/python/blob/master/kubernetes/docs/V1ResourceRequirements.md) | No | None |
| persistentVolumeClaim | a description of the persistent volume claim provisioned for the workspace | AnalyticsWorkspaceJupyterWorkspacePersistentVolumeClaim | No | None |
| additionalStorage | A list of additional persistent volume claims to map to the pods created for this environment. | list(AnalyticsWorkspaceJupyterWorkspaceAdditionalStorage) | No | None

### AnalyticsWorkspaceJupyterWorkspacePersistentVolumeClaim

| Property | Description | Type | Required | Default Value |
| --- | --- | --- | --- | --- |
| storageClassName | The name of the storage class to create the persistent volume claim. If not populated, it will default to the system default. This is only applied when a PVC is initially created, it is ignored otherwise. | string | No | None |
| name | The name of the default persistent volume claim to associate with this workspace. If not populated, it will use the workspace name to generate a new name for the PVC automatically | string | No | None |

### AnalyticsWorkspaceJupyterWorkspaceAdditionalStorage
This has not yet been implemented

| Property | Description | Type | Required | Default Value |
| --- | --- | --- | --- | --- |
| mountPath | The directory to mount this storage in the claim | string | No | None |
| persistentVolumeClaim | The name of the persistent volume claim to apply | string | No | None |
| storageClassName | The storage class name applied to the persistent volume claim (if it doesn't already exist). | string | No | None |
