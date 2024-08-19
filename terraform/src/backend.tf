terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "app-server"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "terraform-state-db"
    role_arn           = "arn:aws:iam::1111111111:role/terraform-backend"
  }
}