output "lb_dns_name" {
  value = aws_lb.app_lb.dns_name
}

output "lb_tg_arn" {
  value = aws_lb_target_group.app_target_group.arn
}

output "lb_sg_id" {
  value = aws_security_group.lb_security_group.id
}