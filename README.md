# Terraform Project: Nginx Proxy with Apache Backend

## Description
This Terraform project sets up a highly available infrastructure on AWS, consisting of:
- Public EC2 instances running Nginx as a reverse proxy.
- Private EC2 instances running Apache web servers.
- A public Network Load Balancer (NLB) in front of the Nginx instances.
- A private Application Load Balancer (ALB) in front of the Apache instances.
The project also sets up a NAT gateway for internet access from private subnets.
## Prerequisites
- [Terraform](https://www.terraform.io/) v1.x
- AWS CLI configured with access credentials
- SSH key pair for connecting to EC2 instances
- Git for version control (optional)
## Project Structure
.
├── main.tf                  # Main Terraform configuration
├── modules/
│   ├── vpc/                 # VPC module for creating subnets, route tables, etc.
│   ├── proxy/               # Module for Nginx proxy instances
│   └── apache/              # Module for Apache backend instances
├── outputs.tf               # Output variables
├── variables.tf             # Input variables
└── README.md                # Project documentation (this file)

## Setup and Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/Omarr-adel/Terraform-project.git
   cd Terraform-project
terraform init
terraform apply

### 6. **Variables**
List any important variables and describe their purpose:
```md
## Variables

| Variable Name        | Description                           | Default Value             |
|----------------------|---------------------------------------|---------------------------|
| `vpc_cidr`           | CIDR block for the VPC                | `10.0.0.0/16`             |
| `public_subnets`     | List of public subnet CIDRs           | `["10.0.0.0/24", "10.0.1.0/24"]` |
| `private_subnets`    | List of private subnet CIDRs          | `["10.0.2.0/24", "10.0.3.0/24"]` |
## Outputs

| Output Name           | Description                               |
|-----------------------|-------------------------------------------|
| `public_lb_dns`       | DNS name of the public Network Load Balancer (NLB) |
| `private_alb_dns`     | DNS name of the private Application Load Balancer (ALB) |
