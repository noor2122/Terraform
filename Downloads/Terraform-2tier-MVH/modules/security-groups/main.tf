#================ Web Security Group ================
resource "aws_security_group" "web_server_sg" {
  vpc_id = "${var.vpc_id}"
  name = "web_server_sg"
  description = "Web Server Security Group"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]   #You must restrict this to your own IP address
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_server_sg"
  }
}

output "out_web_server_sg_id" {
  value = "${aws_security_group.web_server_sg.id}"
}

#================ App Security Group ================
resource "aws_security_group" "app_server_sg" {
  vpc_id = "${var.vpc_id}"
  name = "app_server_sg"
  description = "Application Server Security Group"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app_server_sg"
  }
}

output "out_app_server_sg_id" {
  value = "${aws_security_group.app_server_sg.id}"
}

#================ RDS Security Group ================
resource "aws_security_group" "rds_sg" {
  vpc_id = "${var.vpc_id}"
  name = "rds_sg"
  description = "MySQL DB Security Group"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}

output "out_rds_sg_id" {
  value = "${aws_security_group.rds_sg.id}"
}
