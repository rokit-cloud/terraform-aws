output "instance_id" {
  description = "ID of the EC2 web server"
  value       = aws_instance.web.id
}

output "elastic_ip" {
  description = "Public Elastic IP of the web server"
  value       = aws_eip.web.public_ip
}
