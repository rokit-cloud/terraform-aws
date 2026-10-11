resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile_name

  associate_public_ip_address = true
  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 8
  }

  user_data = <<-USERDATA
    #!/bin/bash
    set -eux
    dnf install -y nginx
    cat > /usr/share/nginx/html/index.html <<'HTML'
    <!doctype html>
    <html>
    <head><title>Project 03</title></head>
    <body style="font-family:Arial;text-align:center;margin-top:80px">
    <h1>Deployed by Terraform + GitHub Actions</h1>
    <p>Project 03 web server is running.</p>
    </body>
    </html>
    HTML
    systemctl enable --now nginx
  USERDATA

  tags = {
    Name        = "${var.environment}-web-server"
    Environment = var.environment
  }
}

resource "aws_eip" "web" {
  domain = "vpc"

  tags = {
    Name        = "${var.environment}-web-eip"
    Environment = var.environment
  }
}

resource "aws_eip_association" "web" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.web.id
}
