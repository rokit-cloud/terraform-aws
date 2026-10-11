terraform {
  backend "s3" {
    bucket       = "rokit-terraform-state-767397747047-2026"
    key          = "project-03/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
