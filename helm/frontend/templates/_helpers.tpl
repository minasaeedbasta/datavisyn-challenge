{{- define "frontend-chart.name" -}}
frontend-chart
{{- end -}}

{{- define "frontend-chart.fullname" -}}
{{ .Release.Name }}-frontend
{{- end -}}
