output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}

output "rds_sg_id" {
  value = aws_security_group.aws_db_sg.id
}