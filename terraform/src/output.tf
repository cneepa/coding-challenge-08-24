output "lb_endpoint" {
  value = module.aws_lb.lb_dns_name
}