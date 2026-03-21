locals {
  tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "vpc" {
  source               = "../../modules/vpc"
  name                 = "${var.project}-${var.environment}"
  cidr_block           = "10.10.0.0/16"
  availability_zones   = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnet_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]
  tags                 = local.tags
}

module "web_sg" {
  source      = "../../modules/security_group"
  name        = "${var.project}-${var.environment}-web-sg"
  description = "Web security group"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = [
    {
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      description = "All outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = local.tags
}

module "app_role" {
  source             = "../../modules/iam_role"
  name               = "${var.project}-${var.environment}-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
  tags = local.tags
}

module "logs_bucket" {
  source        = "../../modules/s3_bucket"
  bucket_name   = "${var.project}-${var.environment}-logs-example-123456"
  versioning    = true
  force_destroy = false
  tags          = local.tags
}

module "ec2" {
  source                 = "../../modules/ec2_instance"
  name                   = "${var.project}-${var.environment}-web"
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  subnet_id              = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids = [module.web_sg.security_group_id]
  iam_instance_profile   = module.app_role.instance_profile_name
  associate_public_ip    = true
  user_data              = <<-EOT
              #!/bin/bash
              yum update -y
              EOT
  tags = local.tags
}

module "db" {
  source                 = "../../modules/rds_instance"
  identifier             = "${var.project}-${var.environment}-db"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t4g.micro"
  allocated_storage      = 20
  db_name                = "appdb"
  username               = "appadmin"
  password               = var.db_password
  subnet_ids             = module.vpc.private_subnet_ids
  vpc_security_group_ids = [module.web_sg.security_group_id]
  publicly_accessible    = false
  tags                   = local.tags
}
