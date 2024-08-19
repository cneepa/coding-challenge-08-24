resource "aws_db_instance" "db_instance" {
  allocated_storage     = var.db_storage
  max_allocated_storage = var.db_max_allocated_storage
  db_name               = "${var.name}-${var.tier}-${var.env}-db"
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_class        = var.instance_class
  storage_encrypted     = var.storage_encrypted
  kms_key_id            = var.kms_key_arn
  master_username       = var.db_username
  master_password       = var.db_password
  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-db"
  }, var.tags)

  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.aws_db_sg.id]
  maintenance_window      = var.maintenance_window
  deletion_protection     = var.deletion_protection
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.name}-${var.tier}-${var.env}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-subnet-group"
  }, var.tags)
}

resource "aws_security_group" "aws_db_sg" {
  name        = "${var.name}-${var.tier}-${var.env}-rds"
  description = "Security group for the RDS"
  vpc_id      = var.vpc_id

  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-rds"
  }, var.tags)
}