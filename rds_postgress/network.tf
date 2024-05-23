# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.dns_enable
}

# Create Subnets in different AZs
resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}
