## Installation

```bash
helm install my-helloworld ./charts/docker-helloworld
```

## Upgrade 
```bash
helm upgrade my-helloworld ./docker-helloworld-chart --set replicaCount=3
```

## Why is Helm important for managing configuration across different environments in a real-world product (e.g., dev, staging, prod)?
### Helm helps you package your Kubernetes manifests into reusable charts with configurable parameters (through values.yaml). It allows you to have a single chart that can be customized for different environments by providing different values files or overrides that are environment-specific. You can modify your deployment's replica counts, resource limits, image tags, or service types, and not have to change the underlying manifests. This provides consistency, reduces duplication, and makes it easier to manage the configuration for multiple environments with less chance of failure.

## How does Helm simplify deployment rollback during a production incident?
### Helm uses versions to keep track of every release and their deployment history. In case any deployment causes problems in the production, Helm allows an immediate rollback to a previous stable release version based on one command, called helm rollback. This way, it applies all changes required to revert the Kubernetes resources back to a known good state without manual intervention or stressful troubleshooting, limiting the downtime during critical periods.