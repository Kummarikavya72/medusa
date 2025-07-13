resource "aws_ecr_repository" "medusa" {
  name                 = "medusa-backend"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "IMMUTABLE"
}
