{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "branchprotector.name" -}}
{{- default "tide" .Values.branchprotector.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "build.name" -}}
{{- default "prow-build" .Values.tide.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "prow.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "deck.name" -}}
{{- default "deck" .Values.deck.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "hook.name" -}}
{{- default "hook" .Values.hook.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "horologium.name" -}}
{{- default "horologium" .Values.horologium.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "plank.name" -}}
{{- default "plank" .Values.plank.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sinker.name" -}}
{{- default "sinker" .Values.sinker.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tide.name" -}}
{{- default "tide" .Values.tide.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tot.name" -}}
{{- default "tide" .Values.tot.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "prow.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
