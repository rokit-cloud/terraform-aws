# Project-03: AWS Infrastructure Automation Using Terraform & GitHub Actions

## Objective
Provision AWS infrastructure using Terraform and automate the infrastructure deployment lifecycle through GitHub Actions.

## Tools Used
- Terraform
- AWS (Amazon Web Services)
- Git and GitHub
- GitHub Actions CI/CD
- PowerShell

## Infrastructure Designed & Provisioned
- VPC and two public subnets
- Internet Gateway and routing table associations
- Security Group allowing HTTP access
- EC2 instance with Elastic IP and Nginx web server
- Secure S3 bucket with versioning, encryption, and public access block
- IAM role and instance profile for least-privilege EC2 access
- Remote S3 backend state with locking

## Validation & Deployment Status
- `terraform fmt -check -recursive` — Passed
- `terraform validate` — Passed
- GitHub Actions CI/CD Pipeline (Format, Init, Validate, Plan, Artifact, Approval, Apply, Outputs) — Passed successfully with manual approval protection.
- Actual AWS infrastructure successfully provisioned and verified.

## Application URL
- http://3.7.81.77

## GitHub Repository
https://github.com/rokit-cloud/terraform-aws

## Evidence / Screenshots
1. Successful local Terraform plan and apply execution
2. Successful GitHub Actions workflow execution and manual deployment approval
3. AWS Console resources (EC2, VPC, S3, Elastic IP)
4. Working web server landing page via Elastic IP

## Conclusion
This project successfully demonstrates infrastructure automation using Terraform modules, secure S3 remote state management, and a complete GitHub Actions CI/CD pipeline featuring manual approval before applying production infrastructure changes.
