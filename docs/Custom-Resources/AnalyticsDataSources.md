---
title: AnalyticsDataSources
parent: Custom Resources
layout: page
grand_parent: Developer Guide
nav_order: 3
---

Please note that this resource is part of a proof of concept for data source management and should not be used in production environments.

An analytics workspace data source resource represents data that either exists externally to the system that can be imported into a workspace, or data that has been uploaded into the system via the [manual airlock functionality](../../Architecture/Airlock-Services.md).

The following is an example of an uploaded analytics workspace data source:

```yaml
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsDataSource
metadata:
  name: ds-782b4a1f07234229980f75f2f651412a
  labels:
    xlscsde.nhs.uk/type: uploaded
spec:
  type: Uploaded

  publisher:
    organisation: Some Organisation
    contact:
      name: Joe Bloggs
      role: Research Engineer

  project: 
    id: d4e6

  displayName: An uploaded example dataset
  description: |
    An example dataset which the user has brought for themselves and uploaded into the system.

  license: |
    This sample data may ONLY be used for demos

  connections:
  - type: pvc
    name: pvc-782b4a1f07234229980f75f2f651412a
```

Once an AnalyticsDataSource is defined, it can be linked to an [AnalyticsWorkspace](./AnalyticsWorkspaces.md) via an [AnalyticsDataSourceBinding](./AnalyticsDataSourceBindings.md). This can then make it available to the workspace.
