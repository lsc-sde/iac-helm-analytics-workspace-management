---
title: AnalyticsDataSourceBindings
parent: Custom Resources
layout: page
grand_parent: Developer Guide
nav_order: 4
---

Please note that this resource is part of a proof of concept for data source management and should not be used in production environments.

An AnalyticsWorkspaceDataBinding resource binds a [AnalyticsDataSource](./AnalyticsDataSources.md) to an [AnalyticsWorkspace](./AnalyticsWorkspaces.md).

```yaml
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsDataSourceBinding
metadata:
  name: dsb-782b4a1f07234229980f75f2f651412a
spec:
  workspace: advanced-generic-workspace
  datasource: ds-782b4a1f07234229980f75f2f651412a
```
