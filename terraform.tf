provider "aws" {}
# variable "security_group_id" {}


resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.1.0/24"
    tags {
      Name = "main_vpc"
    }
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id = "${aws_vpc.main_vpc.id}"
    cidr_block = "10.0.1.0/26"
    tags {
      Name = "PublicSubnet1"
    }
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjwImodLSsG4SHJZMc1syK0o/5WiFr2Qr+n76ksSSR2Mfiqi4xlq1INRM8k30ebyhUtAESx7zH7vVuLphheWwks9VKAcsjrNcvjXFYk8Qc5M3Jydge2dnIA7BODwKSvZiZnaC6Dm0Si0gOf2GcwEHC1tlgssqjjPsIBANgubk+pP6R+Uf9wptQ5xbGjEeQVqC33c+tIU/1WzHzDMOjq0DZfTurNHfM1lvqDEjB2Lg3tKcIKnHgrKEvKg1bbx0nnaGOKld/T0n0WqxULjn+e9bP59D2JWdJ/oQUmEN/WqO+s4MUWchBTCzV2gtEWGQx8gZzr4RGUrRn0Zfg6p5tfUtx john@ghost"
}

resource "aws_default_security_group" "allow_all" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-4e79ed36"
  instance_type = "t2.nano"
  associate_public_ip_address = true
  provisioner "local-exec" { 
    command = "sleep 5"
  }
  tags {
    Name = "prod-web-01"
  }

  key_name = "terraform"

}

resource "aws_instance" "postgres" {
  ami           = "ami-4e79ed36"
  instance_type = "t2.nano"
  associate_public_ip_address = true
  tags {
    Name = "prod-db01"
  }

  key_name = "terraform"
}

