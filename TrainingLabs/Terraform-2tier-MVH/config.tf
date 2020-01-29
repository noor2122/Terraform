#================ State File Backend ==================

terraform {
  backend "s3" {
    bucket = ""
    dynamodb_table = ""
    encrypt = true
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
