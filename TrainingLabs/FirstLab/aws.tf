provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "TestVM" {
  ami           = "ami-09d069a04349dc3cb"
  instance_type = "t2.micro"
  count         = "10terra"
}