output "rds-end-point" {
  value = aws_db_instance.db.endpoint
}

output "rds-identifier" {
  value = aws_db_instance.db.identifier
}