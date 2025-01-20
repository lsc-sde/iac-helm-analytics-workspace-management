---
title: AnalyticsWorkspaceBindings
parent: Custom Resources
layout: page
grand_parent: Developer Guide
nav_order: 2
---

An Analytics Workspace Binding links an [AnalyticsWorkspace](./AnalyticsWorkspaces.md) to a user, effectively giving user access to that workspace. Each binding has an expiry date, which is taken into consideration when providing the user access to the workspace. 

## Labels
AWMS automatically implements the xlscsde.nhs.uk/username label on any binding that doesn't already have the label. As this is used to provide search filtering in the kubernetes API. This prevents having to load all of the workspace bindings and having to filter that way. This not only reduces load on the application but also on the kubernetes API as well. Labels in kubernetes are only allowed to be formatted in specific ways, as a result special characters are removed.

## Custom Resource Definition
The Lancashire and South Cumbria Secure Data Environment (LSC-SDE) [Analytics Workspace Management Solution](../../Analytics-Workspace-Management-Solution.md) (AWMS) leverages [Kubernetes Custom Resource Definitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/) to store and manage workspace bindings

Example:
```yaml
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspaceBinding
metadata:
  labels:
    xlscsde.nhs.uk/username: shaun.turner___headinthecloudsolutions.co.uk
  name: binding-3edad8355fad4fc187610249ed93d63f
  namespace: jupyterhub
spec:
  comments: Testing
  expires: "2024-12-04"
  username: shaun.turner@headinthecloudsolutions.co.uk
  workspace: example-workspace
```

## Schema
### AnalyticsWorkspaceBindingSpec

| Property | Description | Type | Required | Default Value |
| --- | --- | --- | --- | --- |
| workspace | The name of the workspace in kubernetes | string | Yes | |
| expires | The date at which this binding expires | string (date) | Yes | |
| username | The username to match | No | |
| comments | Any comments relating to this binding. | string | No | None |
| replicas | The number of replicas to be setup by this resource  | integer | No | 0 |
| claims | This is not yet implemented | object | No | None |
