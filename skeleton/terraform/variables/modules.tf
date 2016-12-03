module "vpc_subnets" {
        source = "./modules/vpc_subnets"
        name = "${var.app_name}"
        environment = "${var.environment_name}"
        enable_dns_support = true
        enable_dns_hostnames = true
        vpc_cidr = "172.16.0.0/16"
        public_subnets_cidr = "172.16.10.0/24"
        private_subnets_cidr = "172.16.20.0/24"
        azs    = "eu-west-1a,eu-west-1b"
}

module "ssh_sg" {
        source = "./modules/ssh_sg"
        name = "${var.app_name}"
        environment = "${var.environment_name}"
        vpc_id = "${module.vpc_subnets.vpc_id}"
        source_cidr_block = "0.0.0.0/0"
}

module "nginx_sg" { 
	source = "./modules/nginx_sg" 
	name = "${var.app_name}-nginx-sg" 
	vpc_id = "${module.vpc_subnets.vpc_id}"
	source_cidr_block = "0.0.0.0/0" 
} 

module "rds_sg" {
    source = "./modules/rds_sg"
    name = "${var.app_name}-rds-sg"
    environment = "${var.environment_name}"
    vpc_id = "${module.vpc_subnets.vpc_id}"
    security_group_id = "${module.nginx_sg.nginx_sg_id}"
}

module "rds" {
        source = "./modules/rds"
        name = "${var.app_name}-rds-db"
        environment = "${var.environment_name}"
        storage = "5"
        engine_version = "5.6.27"
        db_name = "wordpress"
        username = "root"
        # Can define password in vartf file as well. Making it static for the moment
        password = "ALD41Akip"
        security_group_id = "${module.rds_sg.rds_sg_id}"
        subnet_ids = "${module.vpc_subnets.vpc_id}"
} 
