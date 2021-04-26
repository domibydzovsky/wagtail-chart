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
  value: "django_zero_downtime_migrations.backends.postgres"
- name: DB_DATABASE
  value: {{ .Values.databaseName }}
- name: DB_USER
  value: postgres
- name: DB_PASS
  value: postgres
- name: DB_HOST
  value: "postgres-postgresql.postgres.svc.cluster.local"
- name: DB_PORT
  value: "5432"
{{- end }}

{{/*
Definition of environment variables of database
*/}}
{{- define "deployment.superdatabase" -}}
- name: DB_SUPER_USER
  value: postgres
- name: DB_SUPER_PASS
  value: postgres
- name: DB_SUPER_DATABASE
  value: main
{{- end }}
