output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.main.id
}

output "private_ip" {
  description = "private_ip"
  value       = aws_instance.ps_private_ec2.private_ip
}

output "public_ip" {
  description = "public_ip"
  value       = aws_instance.ps_public_ec2.public_ip
}

output "endpoint" {
  description = "rds endpoint"
  value       = aws_db_instance.rds_instance.endpoint
}
