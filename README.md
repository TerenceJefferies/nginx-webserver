# NGINX EC2 Server

This project contains a basic terraform definition for an NGINX web server, provisioned an accounts default VPC 
allowing HTTP traffic from anywhere.

## Provisioning

### Variables

The following variables are required to provision the server:

1. `aws_region` - The AWS region to provision the server in, defaults to `us-east-1`
2. `instance_type` - EC2 instance type, defaults to `t3.micro`
3. `ami` The Amazon Machine Image ID to use when provisioning the server.

### Executing

1. Configure your ami in the `terraform.tfvars` file
2. Run `terraform init`
3. Run `terraform apply`

## Drawbacks of this approach

1. Using the default VPC is not recommended for production environments, in an actual environment it would be better to provision a bespoke VPC that only accepts traffic for the intended purposes.
2. This approach does not allow access to the server using SSH. In an actual environment it would be better to allow SSH access via a bastion host or VPN connection, allowing for maintenance activities.
