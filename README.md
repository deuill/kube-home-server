# Kubernetes on a Home Server

This repository contains a full range of configuration and deployment primitives for running various web-related services on a single-node Kubernetes cluster (via Minikube). Services include:

  - A fairly standard Nginx, PHP-FPM, MariaDB, Redis stack.
  - A mail-server using Postfix for SMTP, Dovecot for IMAP, Rspamd for anti-spam, DKIM signing and verification, and other goodies.
  - A Git server with public key-only SSH access, for storing private repositories.

Additional services and integrations will be added, including:

  - XMPP server (probably Prosody), IRC gateway (probably Biboumi).
  - Instrumentation of services and node via Prometheus.
  - SSO with two-factor authentication (and hopefully U2F token support) via OpenLDAP or similar.
  - Automatic deployment of selected services via Git hooks.

That said, existing parts are being used in production (where "production" means my own, personal home server) and are derived from previous efforts outside of Kubernetes.

## Getting Started

There is currently no easy way of deploying the entire node with a single command. However, the list of prerequisites is short, and the setup should identically beyond that. To start, install [Minikube][minikube] using the [following guide][installing-minikube].

Additionally, you will need `docker` installed and running if you're running Minikube without a VM driver; in most other cases, Minikube will include an internal Docker daemon you can use.

These are the only host-specific dependencies you will need (assuming that `make` is already installed). In order to deploy services, you will need to first build their Docker images, e.g.:

```
~/k8s $ make default/redis/Dockerfile
```

Then, deploy the service via the `service.yaml` file:

```
~/k8s $ make default/redis/service.yaml
```

Certain services depend on other, additional resources such as `ConfigMap` or `Secret` definitions, which will usually appear as files ending in `.template`, and quite a few services depend upon one another. A graph for building against these dependencies is imminent.

## Exposing Services

Certain services are only useful once exposed to the outside world (mail servers, websites, etc), and for these we'll need to deploy `Ingress` definitions. Following standard procedure, deploy the `kube-system/voyager` Docker image and service, then deploy the `default/ingress/ingress.yaml` file (which you'll probably need to change to fit your requirements). Assuming you can route to the node via external networks, you should be able to access services exposed via the ingress definition.

## License

All code in this repository is covered by the terms of the MIT License, the full text of which can be found in the LICENSE file.

[minikube]: https://github.com/kubernetes/minikube
[installing-minikube]: https://kubernetes.io/docs/getting-started-guides/minikube
