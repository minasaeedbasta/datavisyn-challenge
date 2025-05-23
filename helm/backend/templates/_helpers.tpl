{{- define "backend-chart.name" -}}
backend-chart
{{- end -}}

{{- define "backend-chart.fullname" -}}
{{ .Release.Name }}-backend
{{- end -}}
