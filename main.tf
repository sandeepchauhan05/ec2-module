provider "aws" {
 access_key = "AKIA4LGTC4S7EROWJYL2"
 secret_key = "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"
 region = "ap-south-1"
}

resource "aws_instance" "ec2-instance" {
  ami = var.ami_id  #referring to ami_id variable
  instance_type = var.instance_type #refferring to instance_type variable
  vpc_security_group_ids = [aws_security_group.mysg.id] 

} 

resource "aws_security_group" "mysg"{ 
  name = "allow-ssh" 
  description = "allow ssh traffic"
  vpc_id = var.vpc_id #referring to vpc_id varible

 ingress {
   description = "allow inbound ssh traffic"
   from_port = var.port
   to_port = var.port
   protocol = "tcp"
   cidr_blocks = [var.cidr_block]

}
 

tags = {
  name = "allow_ssh"
 }
}  
