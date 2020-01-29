resource "aws_instance" "terraform_example" {
  ami           = "var.amis[var.aws_region]"
  instance_type = "t2.micro"

}
