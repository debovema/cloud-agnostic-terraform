# _Truly_ cloud-agnostic Terraform samples

## The pitch

We hear a lot about Terraform being a *Cloud-agnostic* tool but in the real-world, even though it can manage the [major](https://www.terraform.io/docs/providers/type/major-index.html) (and [other](https://www.terraform.io/docs/providers/type/cloud-index.html)) Cloud providers, it is almost impossible to deploy a full stack from one Cloud provider to another without rewriting Terraform files.

This lead to the [Cloud-agnostic architecture myth](https://hackernoon.com/cloud-agnostic-architecture-is-a-myth-53eac80be85d).

Let's try to *un*debunk this myth.

## Supported Cloud providers

Currently following Cloud providers are supported:

* Hetzner
* Scaleway

## Usage

### Hetzner

1. [create an API token](https://docs.hetzner.cloud/#overview-getting-started) and export it as HCLOUD_TOKEN environment variable (this is the default environment variable name used by the Hetzner Cloud Terraform provider):

```
export HCLOUD_TOKEN=<REDACTED>
```

Notice that the created token is by definition associated with a *project* in Hetzner Cloud. You can use the "Default" project or create a new one.

2. create an SSH key pair:

```
# generate the SSH key pair
ssh-keygen -t rsa -b 4096 -C "terraform-hetzner" -q -N "" -f ~/.ssh/hetzner
```

3. initialize Terraform variables:

```
cp terraform.tfvars.hetzner terraform.tfvars
```

This sample configuration will:
* use the previously created SSH private key
* create **2** nodes of type *cx11* with Ubuntu 18.04 installed

4. show and apply the Terraform plan:

```
terraform init
terraform plan
terraform apply -auto-approve
```

### Scaleway

1. [retrieve your organization ID and create an API token](https://console.scaleway.com/account/credentials) and export them as SCALEWAY_ORGANIZATION and SCALEWAY_TOKEN environment variables respectively (these are the default environment variable names used by the Scaleway Terraform provider):

```
export SCALEWAY_ORGANIZATION=<REDACTED>
export SCALEWAY_TOKEN=<REDACTED>
```

2. create an SSH key pair and add the public key to the SSH Keys in the [Scaleway console](https://console.scaleway.com/account/credentials):

```
# generate the SSH key pair
ssh-keygen -t rsa -b 4096 -C "terraform-scaleway" -q -N "" -f ~/.ssh/scaleway

# display the public key to add in Scaleway console
cat ~/.ssh/scaleway.pub
```

3. initialize Terraform variables:

```
cp terraform.tfvars.scaleway terraform.tfvars
```

This sample configuration will:
* use the previously created SSH private key
* create **2** nodes of type *VC1S* with Ubuntu 18.04 installed

4. show and apply the Terraform plan:

```
terraform init
terraform plan
terraform apply -auto-approve
```