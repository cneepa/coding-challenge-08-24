resource "aws_vpc_security_group_ingress_rule" "aws_lb_allow_to_https" {
  security_group_id = module.aws_lb.lb_sg_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "aws_lb_allow_to_instance_port" {
  security_group_id            = module.aws_lb.lb_sg_id
  referenced_security_group_id = module.app_server.instance_sg_id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "aws_as_allow_http_from_lb" {
  security_group_id            = module.app_server.instance_sg_id
  referenced_security_group_id = module.aws_lb.lb_sg_id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "aws_as_allow_https_from_lb" {
  security_group_id            = module.app_server.instance_sg_id
  referenced_security_group_id = module.aws_lb.lb_sg_id
  from_port                    = 443
  ip_protocol                  = "tcp"
  to_port                      = 443
}

resource "aws_vpc_security_group_egress_rule" "aws_as_allow_to_db" {
  security_group_id            = module.app_server.instance_sg_id
  referenced_security_group_id = module.aws_rds.rds_sg_id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "aws_rds_allow_to_https" {
  security_group_id            = module.aws_rds.rds_sg_id
  referenced_security_group_id = module.aws_lb.lb_sg_id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "aws_rds_allow_to_https" {
  security_group_id = module.aws_rds.rds_sg_id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
