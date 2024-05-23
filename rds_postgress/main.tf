
# Create RDS PostgreSQL Instance
resource "aws_db_instance" "my_rds_instance" {
  identifier           = var.identifier
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version  # Using a supported version
  instance_class       = var.db_instance_class  # Using a supported instance class
 # name                 = "mydatabase"
  username             = var.username
  password             =var.password
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name

  skip_final_snapshot    = var.skip_final_snapshot
}

# Create DB Subnet Group with subnets from different AZs
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

# Output
output "rds_endpoint" {
  value = aws_db_instance.my_rds_instance.endpoint
}