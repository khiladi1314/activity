data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}



resource "aws_instance" "role-test" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  iam_instance_profile =  var.profile
  security_groups = [var.sg1]
  key_name =  "test_key"



  tags = {
    Name = "nida-ec2"
  }
}


