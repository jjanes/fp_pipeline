variable "access_key" {
  type    = "string"
  default = "value"
}

variable "secret_key" {
  type    = "string"
  default = "value"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "$(var.secret_key"
  region     = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-4e79ed36"
  instance_type = "t2.micro"
}
