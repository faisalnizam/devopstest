output "vpc_id" {
  value = "${module.vpc_subnets.vpc_id}"
}

output "public_subnets_id" {
  value = "${module.vpc_subnets.public_subnets_id}"
}

output "address" {
  value = "${aws_elb.devopsae.dns_name}"
}

output "ip" {
  value = "${join(",", aws_instance.devopsae.*.public_ip)}"
} 

output "rds_address" {
  value = "${module.rds.rds_address}"
}

