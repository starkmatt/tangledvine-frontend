module "vpc" {
  source = "./modules/vpc"
  project_name = "${var.project_name}"
  vpc_cidr = "${var.vpc_cidr}"
  subnet_private_name = "${var.subnet_private_name}"
  subnet_private_cidr = "${var.subnet_private_cidr}"
  subnet_public_name = "${var.subnet_public_name}"
  subnet_public_cidr = "${var.subnet_public_cidr}"
  azs = "${var.azs}"
  cidr_block_all = "${var.cidr_block_all}"
  rule_no_acl = "${var.rule_no_acl}"
}

module "application"{
 source = "./modules/application"
 project_name = "${var.project_name}"
 vpc_id = "${module.vpc.vpc_id}"
 vpc_cidr = "${var.vpc_cidr}"
 ecr_url = "${module.ecr.ecr_url}"
 subnet_private_id = "${module.vpc.subnet_private_id}"
 subnet_private_cidr = "${var.subnet_private_cidr}"
 subnet_public_id = "${module.vpc.subnet_public_id}"
 sg_ecs_id = "${module.ecs.sg_ecs_id}"
 cidr_block_all = "${var.cidr_block_all}"
 iam_policy_arn_task = "${var.iam_policy_arn_task}"
 ecs_cluster = "${module.ecs.ecs_cluster}"
 efs_name = "${var.efs_name}"
 region = "${var.region}"
 db_engine = var.db_engine
 db_allocated_storage = var.db_allocated_storage
 db_instance_class = var.db_instance_class
 db_name = var.db_name
 db_subnet_group_name = var.db_subnet_group_name
 db_engine_version = var.db_engine_version
 db_username = var.db_username
}

module "ecs"{
 source = "./modules/ecs"
 project_name = "${var.project_name}"
 vpc_id = "${module.vpc.vpc_id}"
 subnet_private_id = "${module.vpc.subnet_private_id}"
 image_id = "${var.image_id}"
 instance_type = "${var.instance_type}"
 efs_id = "${module.application.efs_id}"
 lb_tg_arn = "${module.application.lb_tg_arn}"
 cidr_block_all = "${var.cidr_block_all}"
 iam_policy_arn_ec2 = "${var.iam_policy_arn_ec2}"
 sg_lb_id = "${module.application.sg_lb_id}"
 key_name = var.key_name
}

module "ecr" {
 source = "./modules/ecr"
 ecr_repository_image = "${var.ecr_repository_image}"
}

# module "placeholder" {
#  source = "/modules/ec2"
   
# }