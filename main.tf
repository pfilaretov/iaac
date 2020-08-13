provider "aws" {
  profile = "default"
  // TODO - region???
  region = "???"
  // TODO - create
  shared_credentials_file = "C:/users/petr_filaretov/.aws/credentials"
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

// TODO - ami???
resource "aws_instance" "iaac-example" {
  // TODO - which ami???
  ami = "ami-???"
  // TODO - t2 or t3? What does that mean?
  instance_type = "t2.micro"
  // TODO - what is this?
  key_name = "test2"
  // TODO - syntax error?
//  user_data = file("./start.sh")

  connection {
    host = self.public_ip
    type = "ssh"
    // TODO - ???
    user = "ubuntu"
    // TODO - create key? syntax error?
//    private_key = file("./test2.pem")
    agent = false
    timeout = "1m"
  }

  security_groups = ["iaac_security_group_ssh", "iaac_security_group_http"]

  associate_public_ip_address = true
}
