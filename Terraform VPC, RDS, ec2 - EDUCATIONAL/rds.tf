resource "aws_db_instance" "rds_instance" {
  db_subnet_group_name   = aws_db_subnet_group.db_subnetgroup.name
  db_name                = "Postgres_Terraform_Educational"
  allocated_storage      = 20
  identifier             = "terraform_subnetgroup_educational"
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "13.7"
  instance_class         = "db.t3.micro"
  vpc_security_group_ids = [aws_security_group.private-sg.id]
  username               = "postgres"
  password               = "12345678"
  skip_final_snapshot    = true

  tags = {
    Name = "Terraform_PostgresRDS"
  }
  depends_on = [aws_db_subnet_group.db_subnetgroup]
}

resource "aws_db_subnet_group" "db_subnetgroup" {
  name        = "terraform_subnetgroup_educational"
  description = "Terraform RDS subnet group"
  subnet_ids  = ["${aws_subnet.db_subnets[0].id}", "${aws_subnet.db_subnets[1].id}"]
}
