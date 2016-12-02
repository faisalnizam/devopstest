# A security group for the ELB so it is accessible via the web
resource "aws_security_group" "elb" {
  name        = "elb_for_wordpress"
  description = "Wordpress Cluster ELB"
  vpc_id      = "${module.vpc_subnets.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
