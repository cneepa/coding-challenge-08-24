resource "aws_lb" "app_lb" {
  name                       = "${var.name}-${var.tier}-${var.env}-lb"
  internal                   = var.internal
  load_balancer_type         = var.lb_type
  subnets                    = var.subnet_ids
  security_groups            = [aws_security_group.lb_security_group.id]
  enable_deletion_protection = var.enable_deletion_protection
  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-lb"
  }, var.tags)
}

resource "aws_lb_target_group" "app_target_group" {
  name     = "${var.name}-${var.tier}-${var.env}-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = var.tg_health_check.path
    interval            = var.tg_health_check.interval
    timeout             = var.tg_health_check.timeout
    healthy_threshold   = var.tg_health_check.healthy_threshold
    unhealthy_threshold = var.tg_health_check.unhealthy_threshold
  }

  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-tg"
  }, var.tags)
}

resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.cert_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}

resource "aws_security_group" "lb_security_group" {
  name        = "${var.name}-${var.tier}-${var.env}-lb-sg"
  description = "Security group for loadbalancer"
  vpc_id      = var.vpc_id
  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-lb-sg"
  }, var.tags)
}