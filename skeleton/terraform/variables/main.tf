resource "aws_instance" "devopsae" {

  instance_type = "t2.micro"

  ami = "ami-ac772edf"  

  count = "${var.total_number_of_machines}" 
  # Set Names For the Servers With Respect to Count 
	  tags {
 		   Name = "devopsae-${count.index}"
 	       }
}

