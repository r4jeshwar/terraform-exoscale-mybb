# terraform-exoscale-mybb

This terraform plan create the resources of exoscale instance

## What's a Terraform Module?

A Terraform Module refers to a self-contained packages of Terraform configurations that are managed as a group. This repo
is a Terraform Module and contains many "submodules" which can be composed together to create useful infrastructure patterns.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.1.7 |
| exoscale | >= 0.35 |

## Providers

| Name | Version |
|------|---------|
| exoscale | >= 0.35 |

## Resources

| Name | Type |
|------|------|
| [exoscale_compute_instance](https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/compute_instance) | resource |
| [exoscale_security_group](https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/security_group) | resource |
| [exoscale_ssh_key](https://registry.terraform.io/providers/exoscale/exoscale/latest/docs/resources/ssh_key) | resource |
| [random_password.faasd](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

# Inputs

Edit the `variables.tf` file to add the variables as per your need.

| Variable name | Type  | Value | Description |
| ------------- | ----- | ------| ----------- |
| `ssh_key_name` | string | "" | Key name of the Key Pair to use for the instance.  |
| `ssh_pub_key` | string | "" | Public Key Pair to use for the instance. |
| `zone` | string | "" | The name of the zone to deploy the mybb into. |
| `name` | string | "" | The name of the mybb instance. |
| `instance_type` | string | "" | The instance type to use for the instance. |
| `labels` | map | "" | A map of key/value labels. |
| `disk` | number | "" |The disk is to set the storage for instance. |
| `temp_name` | string | "" | The name is to set the template. |
| `firewall_rules` | string | "" | List out the port number and protocall to allow in Firewall Rules |
| `exoscale_api_key` | string | "" | API key for Exoscale |
| `exoscale_api_secret` | string | "" | API secret for Exoscale |
| `user` | string | "" | Set the instance user name |
| `private_key` | string | "" | Set the private key value for the instance from the hostmachine |

## Outputs

| gateway\_url | The url of the mybb gateway |
| ipv4\_address | The public IP address of the mybb instance |