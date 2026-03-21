locals {
  tags = {
    Environment = "dev"
    Project     = var.project_name
    ManagedBy   = "Terraform"


  }


}

module "kms" {
  source     = "../../modules/kms_key"
  alias_name = "${var.project_name}-app"
  tags       = local.tags


}

module "vpc" {
  source     = "../../modules/vpc"
  name       = var.project_name
  cidr_block = "10.20.0.0/16"
  public_subnets = [
    { cidr = "10.20.1.0/24", az = "${var.aws_region}a" },
    { cidr = "10.20.2.0/24", az = "${var.aws_region}b"

    }
  ]
  private_subnets = [
    { cidr = "10.20.11.0/24", az = "${var.aws_region}a" },
    { cidr = "10.20.12.0/24", az = "${var.aws_region}b"

    }
  ]
  tags = local.tags


}

module "web_sg" {
  source      = "../../modules/security_group"
  name        = "${var.project_name}-web-sg"
  description = "Web application security group"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = [
    { cidr_ipv4 = "0.0.0.0/0", protocol = "tcp", from_port = 80, to_port = 80, description = "HTTP"

    }
  ]
  tags = local.tags


}

module "db_sg" {
  source      = "../../modules/security_group"
  name        = "${var.project_name}-db-sg"
  description = "DB security group"
  vpc_id      = module.vpc.vpc_id
  ingress_rules = [
    { cidr_ipv4 = "10.20.0.0/16", protocol = "tcp", from_port = 5432, to_port = 5432, description = "Postgres from VPC"

    }
  ]
  tags = local.tags


}

module "alb" {
  source             = "../../modules/alb"
  name               = "${var.project_name}-alb"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.web_sg.security_group_id]
  tags               = local.tags


}

module "logs" {
  source            = "../../modules/cloudwatch_log_group"
  name              = "/aws/${var.project_name}/app"
  kms_key_id        = module.kms.key_arn
  retention_in_days = 30
  tags              = local.tags


}

module "artifacts" {
  source             = "../../modules/s3_bucket"
  bucket_name        = "${var.project_name}-artifacts-example"
  kms_key_id         = module.kms.key_arn
  versioning_enabled = true
  tags               = local.tags


}

module "ecr" {
  source      = "../../modules/ecr_repository"
  name        = "${var.project_name}-app"
  kms_key_arn = module.kms.key_arn
  tags        = local.tags


}

module "queue" {
  source            = "../../modules/sqs_queue"
  name              = "${var.project_name}-jobs"
  kms_master_key_id = module.kms.key_arn
  tags              = local.tags


}

module "topic" {
  source            = "../../modules/sns_topic"
  name              = "${var.project_name}-alerts"
  kms_master_key_id = module.kms.key_arn
  tags              = local.tags


}

module "table" {
  source   = "../../modules/dynamodb_table"
  name     = "${var.project_name}-state"
  hash_key = "id"
  attributes = [
    { name = "id", type = "S"

    }
  ]
  tags = local.tags


}

module "app_config" {
  source = "../../modules/ssm_parameter"
  name   = "/${var.project_name}/db/password"
  value  = var.db_password
  tags   = local.tags


}

module "ec2" {
  source                      = "../../modules/ec2_instance"
  name                        = "${var.project_name}-web"
  ami_id                      = var.ami_id
  subnet_id                   = module.vpc.public_subnet_ids[0]
  security_group_ids          = [module.web_sg.security_group_id]
  associate_public_ip_address = true
  tags                        = local.tags


}

module "rds" {
  source             = "../../modules/rds_instance"
  identifier         = "${var.project_name}-db"
  db_name            = "appdb"
  username           = "appadmin"
  password           = var.db_password
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.db_sg.security_group_id]
  tags               = local.tags


}
