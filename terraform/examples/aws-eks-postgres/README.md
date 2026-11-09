# Bifrost on EKS with managed PostgreSQL

The one-click EKS stack: a new cluster, one Bifrost pod exposed through a public `LoadBalancer` Service, RDS PostgreSQL 16 (db.t4g.small, 20 GB, encrypted, 7-day backups) for both Bifrost stores, and generated runtime secrets delivered through a Kubernetes Secret.

The fastest path is the deploy script from AWS CloudShell:

```bash
git clone --depth 1 https://github.com/maximhq/bifrost && bifrost/deploy/eks/deploy.sh
```

## Why two phases

The kubernetes provider needs a kubeconfig for a cluster that does not exist yet. The script applies the cluster first with `terraform apply -target`, writes the kubeconfig with the cloud CLI, then applies the rest. Manual users follow the same order:

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
# phase 1: the cluster (see deploy/eks/deploy.sh for the exact -target list)
# write kubeconfig with the cloud CLI
terraform apply
terraform output -raw setup_token; echo
```

## What gets created

| Resource | Purpose |
|---|---|
| Network scaffold | Shared with the other targets of the platform module |
| EKS cluster and node pool | Runs the Bifrost pod |
| RDS PostgreSQL 16 (db.t4g.small, 20 GB, encrypted, 7-day backups) | Config store and log store, reachable only from inside the deployment's network |
| Kubernetes Secrets `bifrost-config` and `bifrost-runtime` | `config.json`; database password, encryption key, setup token |
| `LoadBalancer` Service | Public Network Load Balancer; the URL is the `service_url` output |

The Service is plain HTTP. Add TLS through an ingress controller or the cloud's managed certificates before production traffic. Terraform state stays in this directory; move it to S3 for anything long-lived.

## Enterprise

Set `image_repository` to the registry path Maxim issued for your organization and add an image pull secret as the enterprise guide describes. Enterprise requires PostgreSQL for both stores, which this example provisions.

## Cleanup

```bash
terraform destroy
```
