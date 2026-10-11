output "vpc_id" {
  description = "ID of the project VPC"
  value       = module.networking.vpc_id
}

output "ec2_instance_id" {
  description = "ID of the EC2 web server"
  value       = module.compute.instance_id
}

output "elastic_ip" {
  description = "Public Elastic IP of the web server"
  value       = module.compute.elastic_ip
}

output "application_url" {
  description = "URL of the deployed Nginx website"
  value       = "http://${module.compute.elastic_ip}"
}

output "s3_bucket_name" {
  description = "Name of the application S3 bucket"
  value       = aws_s3_bucket.app_bucket.bucket
}
