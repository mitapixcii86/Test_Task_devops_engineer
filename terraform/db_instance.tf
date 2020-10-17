resource "aws_security_group" "rds_security_group" {
  name        = "rds_security_group"
  description = "rds security group"
  vpc_id      = aws_vpc.test_devops.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_security_group"
  }
}


resource "aws_db_subnet_group" "rds_request" {
  name = "rds_request"
  # subnet_ids = sort(aws_subnet.private.*.id)[count.index]
  subnet_ids = aws_subnet.private.*.id
  tags = {
    Name = "aws_db_subnet_group"
  }
}

output "postgress-address" {
  value = "address: ${aws_db_instance.db.address}"
}

resource "aws_db_instance" "db" {
  engine                    = var.rds_engine
  engine_version            = var.rds_engine_version
  identifier                = var.rds_identifier
  instance_class            = var.rds_instance_type
  allocated_storage         = var.rds_storage_size
  name                      = var.rds_db_name
  username                  = var.rds_admin_user
  password                  = var.rds_admin_password
  publicly_accessible       = var.rds_publicly_accessible
  vpc_security_group_ids    = [aws_security_group.rds_security_group.id]
  final_snapshot_identifier = "test-devops-db-backup"
  skip_final_snapshot       = true
  db_subnet_group_name      = aws_db_subnet_group.rds_request.name
  tags = {
    Name = "Postgres Database in ${var.aws_region}"
  }
}
