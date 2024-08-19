resource "aws_launch_template" "app_server_template" {
  name                   = "${var.name}-${var.tier}-${var.env}-lt"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.aws_as_sg.id]
  user_data              = var.user_date

  tag_specifications {
    tags = merge({
      Name = "${var.name}-${var.tier}-${var.env}-lt"
      },
      var.tags
    )
  }
}

resource "aws_autoscaling_group" "app_server_asg" {
  name = "${var.name}-${var.tier}-${var.env}-asg"
  launch_template {
    id      = aws_launch_template.app_server_template.id
    version = "$Latest"
  }
  vpc_zone_identifier       = var.subnet_ids
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = "EC2"
  health_check_grace_period = 300
  target_group_arns         = var.target_group_arns
  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      propagate_at_launch = true
      value               = tag.value
    }
  }
  lifecycle {
    ignore_changes = [
      desired_capacity
    ]
  }
}

resource "aws_security_group" "aws_as_sg" {
  name        = "${var.name}-${var.tier}-${var.env}-as-asg"
  description = "Security group for the app servers"
  vpc_id      = var.vpc_id
  tags = merge({
    Name = "${var.name}-${var.tier}-${var.env}-as-asg"
  }, var.tags)
}