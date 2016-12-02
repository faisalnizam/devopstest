resource "aws_security_group" "ssh_sg" {
    name = "${var.name}-${var.environment}-ssh"
    description = "Security Group ${var.name}-${var.environment}"
    vpc_id = "${var.vpc_id}"
    tags {
      Name = "${var.name}-${var.environment}-ssh"
      environment =  "${var.environment}"
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }

    ingress {
        from_port = 22
        to_port = 22
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

output "ssh_sg_id" {
  value = "${aws_security_group.ssh_sg.id}"
}
