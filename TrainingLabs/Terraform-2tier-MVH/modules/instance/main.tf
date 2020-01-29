#================ Fetching Latest AMI ================
data "aws_ami" "latest_amazon_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-*-gp2"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

#================ Key Pair ================
resource "aws_key_pair" "web_server_key" {
  key_name = "web_server_key"
  public_key = "${file("${var.key_pair_path}")}"
}

#================ Instance ================
resource "aws_instance" "web_server" {
  ami = "${data.aws_ami.latest_amazon_ami.id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.pub_subnet_1_id}"
  key_name = "${aws_key_pair.web_server_key.key_name}"
  user_data = "${file("${var.user_data_path}")}"
  vpc_security_group_ids = ["${var.web_server_sg_id}"]

  tags = {
	Name = "Web-Server"
	}
}

#================ DB Instance ================
resource "aws_db_instance" "rds_instance" {
  allocated_storage = 10
  storage_type = "gp2"
  engine = "${var.db_engine}"
  engine_version = "${var.engine_version}"
  instance_class = "${var.db_instance_class}"
  identifier = "${var.db_identifier}"
  name = "${var.db_name}"
  username = "${var.db_username}"
  password = "${var.db_password}"
  availability_zone = "${var.aws_region}a"
  vpc_security_group_ids = ["${var.rds_sg_id}"]
  skip_final_snapshot = "${var.db_skip_final_snapshot}"
  backup_retention_period = "${var.db_backup_retention_period}"
  db_subnet_group_name = "${var.rds_subnet_name}"
}

