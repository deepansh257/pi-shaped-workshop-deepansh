{{- define "docker-helloworld.name" -}}
docker-helloworld
{{- end -}}

{{- define "docker-helloworld.fullname" -}}
{{ include "docker-helloworld.name" . }}
{{- end -}}
