module "vpc" {
  source = "./modules/vpc"

  aws_region = "${var.aws_region}"
}


module "security-group" {
  source = "./modules/security-groups"

  vpc_id = "${module.vpc.out_vpc_id}"
  aws_region = "${var.aws_region}"
  vpc_cidr_block = "${module.vpc.out_vpc_cidr_block}"
}

module "instance" {
  source = "./modules/instance"

  vpc_id = "${module.vpc.out_vpc_id}"
  aws_region = "${var.aws_region}"
  key_pair_path = "${var.key_pair_path}"
  pub_subnet_1_id = "${module.vpc.out_pub_subnet_1_id}"
  pub_subnet_2_id = "${module.vpc.out_pub_subnet_2_id}"
  user_data_path = "${var.user_data_path}"
  web_server_sg_id = "${module.security-group.out_web_server_sg_id}"
  db_engine = "${var.db_engine}"
  engine_version = "${var.engine_version}"
  db_instance_class = "${var.db_instance_class}"
  db_identifier = "${var.db_identifier}"
  db_name = "${var.db_name}"
  db_username = "${var.db_username}"
  db_password = "${var.db_password}"
  db_skip_final_snapshot = "${var.db_skip_final_snapshot}"
  db_backup_retention_period = "${var.db_backup_retention_period}"
  rds_subnet_name = "${module.vpc.out_rds_subnet_name}"
  rds_sg_id = "${module.security-group.out_rds_sg_id}"
  instance_type = "${var.instance_type}"
}
