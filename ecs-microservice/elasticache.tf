resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  count      = var.use_elasticache == true ? 1 : 0
  name       = "${var.name_prefix}-cache-subnet-${var.service_name}"
  subnet_ids = var.vpc.private_subnet_ids
}

resource "aws_security_group" "cache_sg" {
  count  = var.use_elasticache == true ? 1 : 0
  name   = "${var.name_prefix}-cache_sg-${var.service_name}"
  vpc_id = var.vpc.vpc_id
  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    security_groups = [
    module.ecs_fargate_microservice.service_sg_id]
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    security_groups = [
    module.ecs_fargate_microservice.service_sg_id]
  }
}


resource "aws_elasticache_replication_group" "elasticache_replication_group" {
  count                         = var.use_elasticache == true ? 1 : 0
  automatic_failover_enabled    = var.cache_automatic_failover_enabled
  at_rest_encryption_enabled    = true
  transit_encryption_enabled    = true
  replication_group_id          = "rg-${var.service_name}"
  replication_group_description = "Replication group for ElastiCache"
  engine                        = "redis"
  node_type                     = var.cache_node_type
  number_cache_clusters         = var.cache_number_cache_clusters
  parameter_group_name          = "default.redis5.0"
  engine_version                = "5.0.5"
  port                          = 6379
  subnet_group_name             = aws_elasticache_subnet_group.elasticache_subnet_group[0].name
  security_group_ids = [
  aws_security_group.cache_sg[0].id]
}

resource "aws_ssm_parameter" "cache_url" {
  count     = var.use_elasticache == true ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/redis/uri"
  type      = "String"
  value     = "rediss://${aws_elasticache_replication_group.elasticache_replication_group[0].primary_endpoint_address}"
  overwrite = true
}

resource "aws_ssm_parameter" "cache_ssl" {
  count     = var.use_elasticache == true ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/redis/ssl"
  type      = "String"
  value     = "true"
  overwrite = true
}
