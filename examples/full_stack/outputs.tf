output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "bucket_id" {
  value = module.logs_bucket.bucket_id
}

output "db_endpoint" {
  value = module.db.endpoint
}
