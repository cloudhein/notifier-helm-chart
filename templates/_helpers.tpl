{{/*
Expand the name of the chart.
*/}}
{{- define "notifier.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Fullname of the deployment.
*/}}
{{- define "notifier.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "notifier.labels" -}}
app: {{ include "notifier.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "notifier.selectorLabels" -}}
app: {{ include "notifier.name" . }}
{{- end }}
