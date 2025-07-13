variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "ecr_repo_uri" {
  description = "ECR repository URI"
  type        = string
}

variable "db_connection" {
  description = "PostgreSQL connection URL"
  type        = string
}

variable "redis_url" {
  description = "Redis connection URL"
  type        = string
}

variable "jwt_secret" {
  description = "Secret for JWT"
  type        = string
}

variable "cookie_secret" {
  description = "Secret for cookies"
  type        = string
}
