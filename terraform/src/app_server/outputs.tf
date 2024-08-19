output "instance_ids" {
  value = aws_autoscaling_group.app_server_asg.id
}

output "instance_sg_id" {
  value = aws_security_group.aws_as_sg.id
}