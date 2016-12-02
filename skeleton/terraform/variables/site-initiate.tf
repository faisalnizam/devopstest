# Resource Defining the Key Pair
resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
} 


# Starting Infrastructure As a Code 
resource "aws_instance" "devopsae" {
  ami = "ami-ac772edf"  

  # The name of our SSH keypair we created above.
    key_name = "${aws_key_pair.auth.id}"

    count = "${var.total_number_of_machines}" 
  # Set Names For the Servers With Respect to Count 
	  tags {
 		   Name = "devopsae-${count.index}"
 	       }

     connection {
   # The default username for our AMI
     user = "ubuntu"
     private_key = "${file("/home/devopstest/.ssh/id_rsa")}"
   # The connection will use the local SSH agent for authentication.
   # For Relative Path : private_key = "${file("${path.module}/keys/id_rsa")}"
                }

 
  # Assign the VPC Security Group 
    vpc_security_group_ids = ["${module.ssh_sg.ssh_sg_id}","${module.nginx_sg.nginx_sg_id}"]

  # Assign the Subnet ID's forr the AMI Create
    subnet_id = "${module.vpc_subnets.public_subnets_id}"
 
  # Instance Type of the AMI  
  instance_type = "t2.micro"
  
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]

}

}
