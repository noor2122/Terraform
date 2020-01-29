resource "aws_instance" "terraform-remoteState" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.terraform-remoteState.private_ip} >> private_ips.txt"
  }
}

output "ip" {
  value = aws_instance.terraform-remoteState.public_ip
}

