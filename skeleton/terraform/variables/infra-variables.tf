variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

# Get Default AMI IDS from https://cloud-images.ubuntu.com/locator/ec2/ 14.04 For Regions  LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-ac772edf"
    us-east-1 = "ami-d680b9c1"
    us-gov-west-1 = "ami-34df6755"
    eu-central-1 = "ami-9d1fd8f2"
  }
}

variable rds_password {
   description = "Password for Wordpress Shared DB On RDS" 
   default = "ALD41Akip" 
}

variable domain_name {
   description = "Domain Name of Environment" 
   default = "devops.ae" 
}

/*
variable hosted_zone_id {
   description = "Zone ID" 
   default = "Z132HODITPRQ5P" 
} */ 

variable total_number_of_machines  {  
   description = "Total Number of Machines Required" 
   default = "1" 
} 

variable app_name { 
   description = "Define Name Of Project" 
   default = "wordpress" 
} 

variable environment_name { 
   description = "Environment Name" 
   default     = "test" 
} 

variable "public_key_path" {
  description = "Public Key For AMI's to access them seamlessly using the Private Key Later" 
  default = "/home/devopstest/.ssh/id_rsa.pub" 
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "devopskyes" 
}
