#RDS Resources

resource "aws_db_subnet_group" "maridb_subnets" {
  name = "mariadb-subnets"
  description = "Amazon RDS Subnet Group"
  subnet_ids = [aws_subnet.lavel_up_private_subnet1.id, aws_subnet.lavel_up_private_subnet2.id]
}

# RDS Parameters

resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
  name = "levelup-mariadb-parameters"
  family = "mariadb10.6"
  description = "MariaDB Parameter Group"

  parameter {
    name = "max_allowed_packet"
    value = "16777216"
  }
}

# RDS Instance Properties
resource "aws_db_instance" "levelup_mariadb" {
  allocated_storage = 10
  engine = "mariadb"
  engine_version = "10.6.14"  # Changed to a supported version
  instance_class = "db.t2.micro"  # Keep micro instance
  identifier = "mariadb"
  username = "root"
  password = "Admin@123"
  db_subnet_group_name = aws_db_subnet_group.maridb_subnets.name
  parameter_group_name = aws_db_parameter_group.levelup-mariadb-parameters.name
  multi_az = "false"
  vpc_security_group_ids = [aws_security_group.allow_mariadb.id]
  storage_type = "gp2"
  backup_retention_period = 30
  availability_zone = aws_subnet.lavel_up_private_subnet1.availability_zone
  skip_final_snapshot = true
  tags = {
    name = "levelup_mariadb"
  }

}

output "rds" {
  value = aws_db_instance.levelup_mariadb.endpoint
}