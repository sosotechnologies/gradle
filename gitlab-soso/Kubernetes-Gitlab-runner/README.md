# Install GITLAB in K8S

https://docs.gitlab.com/runner/install/kubernetes.html

```
helm repo add gitlab https://charts.gitlab.io
```

```
wget https://gitlab.com/gitlab-org/charts/gitlab-runner/-/raw/main/values.yaml
```

```
kubectl create ns soso-gitlab-runner-helm
```

***make the following updates:***
BEFORE:

- gitlabUrl: http://gitlab.your-domain.com/
- runnerRegistrationToken: ""
- For RBAC support:
rbac:
  create: false
   ...
  NOTE: Uncomment all the rules
- runners:
  config: |
    [[runners]]
      [runners.kubernetes]
        namespace = "{{.Release.Namespace}}"
        image = "ubuntu:16.04"
NOTE: You can change the gitlab runner to suite ur usecase

AFTER:

- gitlabUrl: http://gitlab.com/
- runnerRegistrationToken: "VBagerfdwefbarEWDEFV"
- runners:
  config: |
    [[runners]]
      [runners.kubernetes]
        namespace = "{{.Release.Namespace}}"
        image = "arm64v8/clojure"
        helper_image = "gitlab/gitlab-runner-helper:ubuntu-arm64-v16.2.0"

- For RBAC support:
rbac:
  create: true

GR1348941s6SLWmdSZQExGxqW8wVT

```
helm install --namespace soso-gitlab-runner-helm gitlab-runner -f values.yaml gitlab/gitlab-runner
helm list -A
helm status gitlab-runner
```

```
helm uninstall gitlab-runner -n soso-gitlab-runner-helm
```