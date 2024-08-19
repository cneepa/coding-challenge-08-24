module "app_server" {
  source     = "./app_server"
  ami_id     = var.ami_id
  tier       = var.tier
  env        = var.env
  name       = var.name
  subnet_ids = data.aws_subnets.private_subnets.ids
  tags = merge({
    environment = var.env,
    tier        = var.tier
  }, var.tags)

  target_group_arns = [module.aws_lb.lb_tg_arn]
  vpc_id            = data.aws_vpc.vpc.id
  user_data         = file("templates/userdata.sh")
}

module "aws_lb" {
  source   = "./aws_lb"
  cert_arn = var.cert_arn
  vpc_id   = data.aws_vpc.vpc.id
  env      = var.env
  name     = var.name
  tags = merge({
    environment = var.env,
    tier        = var.tier
  }, var.tags)
  subnet_ids = data.aws_subnets.public_subnets.ids
  tier       = var.tier
}

module "aws_rds" {
  source      = "./aws_rds"
  env         = var.env
  kms_key_id  = var.kms_key_id
  name        = var.name
  subnet_ids  = data.aws_subnets.restricted_subnets.ids
  tags        = var.tags
  tier        = var.tier
  vpc_id      = data.aws_vpc.vpc.id
  kms_key_arn = var.kms_key_arn
}
