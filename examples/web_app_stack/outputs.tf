output "vpc_id" {
  value = module.vpc.vpc_id

}
output "alb_dns_name" {
  value = module.alb.dns_name

}
output "ec2_instance_id" {
  value = module.ec2.instance_id

}
output "rds_endpoint" {
  value = module.rds.db_endpoint

}
output "artifacts_bucket" {
  value = module.artifacts.bucket_id

}
output "ecr_repository_url" {
  value = module.ecr.repository_url

}
