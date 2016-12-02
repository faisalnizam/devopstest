resource "aws_security_group" "nginx_sg" {
    name = "${var.name}-${var.environment}-nginx"
    description = "Security Group ${var.name}-${var.environment}"
    vpc_id = "${var.vpc_id}"
    tags {
      Name = "${var.name}-${var.environment}-web"
      environment =  "${var.environment}"
    }
    # Allows traffic For Security Group Nginx  
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }

   # Allow Traffic Port 80
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

   # Allow Traffic Port 443 Not Needed At This Stage
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}

output "nginx_sg_id" {
  value = "${aws_security_group.nginx_sg.id}"
}
