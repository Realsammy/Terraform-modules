
# Create an Ubuntu EC2 instance
resource "aws_instance" "ubuntu" {
  ami                    = var.ami # This is the Ubuntu 20.04 LTS AMI for us-west-2 region
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main.id
  associate_public_ip_address = true  # Assign a public IP address

  # Associate the security group created earlier
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "test-vm"
  }

  # Add user_data for initial setup (optional)
  # Add user_data for initial setup (install Apache, Docker, and Docker Compose)
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get upgrade -y
              
              # Install Apache
              apt-get install -y apache2

              # Install Docker
              apt-get install -y \
                apt-transport-https \
                ca-certificates \
                curl \
                software-properties-common

              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
              add-apt-repository \
                "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) \
                stable"

              apt-get update
              apt-get install -y docker-ce

              # Install Docker Compose
              curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose

              # Verify installation
              docker --version
              docker-compose --version
              EOF
}
# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.ubuntu.public_ip
}

#ami           = "ami-04b70fa74e45c3917"