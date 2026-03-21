resource "aws_launch_template" "this" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = var.security_group_ids

  user_data = var.user_data_base64

  block_device_mappings {
    device_name = var.device_name
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
      encrypted   = true


    }


  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags


  }


}
