# 🛡️ Secure Web App with Public Proxy + Private Backend on AWS | Terraform

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![NGINX](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

## 📜 Overview
Terraform-managed AWS infrastructure deploying a **secure web application** with:
- **Public-facing NGINX reverse proxies** (in public subnets)
- **Isolated backend servers** (in private subnets)
- **Dual load balancers** for layered traffic control

## 🌐 Architecture

A VPC consists of:

- **2 Public Subnets** → Containing EC2 Instances acting as Nginx Reverse Proxy.
- **2 Private Subnets** → Containing EC2 Instances acting as Web Application Backends (e.g., Flask/Node.js/Apache).
- NAT Gateway + Internet Gateway.
- **2 Load Balancers:**
   - Public ALB → Directs traffic to proxies.
   - Internal ALB → Directs traffic from proxies to backend servers.
 
## Getting Started

There are few things you need before deploying the infrastructure:

- Terraform to be installed on your machine
- AWS credentials

These are two things you can't work without.


## Installation

1- Download the project

```bash
  git clone https://github.com/ZEYAD1351/Terraform-AWS-infrastructure.git
```

2- Access the Directory 
```bash
  cd Terraform-AWS-infrastructure
```

3- Open the terminal and run (Don't forget to configure your credentials before advancing):
```bash
  terraform init
```

4- Confirm the changes and then run:
```bash
  terraform apply
```

5- You can access your AWS console.
