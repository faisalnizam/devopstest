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

