terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.12.0"
    }
  }
  required_version = ">= 0.12"
}
