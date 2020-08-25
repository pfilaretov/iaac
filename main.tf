provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = "%userprofile%/.aws/credentials"
  profile = "pf"
}

resource "aws_security_group" "ssh" {
  name = "iaac_security_group_ssh"
  description = "AWS SSH security group for IaaC example"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http" {
  name = "iaac_security_group_http"
  description = "AWS HTTP security group for IaaC example"
  ingress {
    from_port = 7060
    to_port = 7060
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "iaac-example" {
  // CentOS 7
  ami = "ami-0b850cf02cc00fdc8"
  instance_type = "t2.micro"
  key_name = "iaac_key_pair"
  user_data = file("./start.sh")

  connection {
    type = "ssh"
    host = self.public_ip
    user = "centos"
    private_key = file("%userprofile%/.aws/iaac_key_pair.ppk")
    agent = false
    timeout = "5m"
  }

  security_groups = ["iaac_security_group_ssh", "iaac_security_group_http"]

  associate_public_ip_address = true
}
