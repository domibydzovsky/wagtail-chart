{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "deployment.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "deployment.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "deployment.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Definition of environment variables of database
*/}}
{{- define "deployment.database" -}}
- name: DB_ENGINE
  value: {{ .Values.db.engine }}
- name: DB_DATABASE
  value: {{ .Values.db.name }}
- name: DB_USER
  value: {{ .Values.db.user }}
- name: DB_PASS
  value: {{ .Values.db.pass }}
- name: DB_HOST
  value: {{ .Values.db.host }}
- name: DB_PORT
  value: {{ .Values.db.port | quote }}
{{- end }}

{{/*
Definition of environment variables of database
*/}}
{{- define "deployment.superdatabase" -}}
- name: DB_SUPER_USER
  value: {{ .Values.db.superuser }}
- name: DB_SUPER_PASS
  value: {{ .Values.db.superpass }}
- name: DB_SUPER_DATABASE
  value: {{ .Values.db.superdb }}
{{- end }}
