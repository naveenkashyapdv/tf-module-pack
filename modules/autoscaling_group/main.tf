resource "aws_autoscaling_group" "this" {
  name                = var.name
  vpc_zone_identifier = var.subnet_ids
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version


  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true


  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true


    }


  }


}
