{{- define "analytics-workspace-management.operator.name" -}}
{{- printf "%s-operator" .Release.Name }}
{{- end }}

{{- define "analytics-workspace-management.admin.name" -}}
{{- printf "%s-admin" .Release.Name }}
{{- end }}
