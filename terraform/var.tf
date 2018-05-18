variable "default_key_name" { 
  default = "terraform"
  type = "string"
}
variable "vpc_default_name" {
  default = "vps_allow_all"
  type = "string"
}
variable "ssh_default_key" {
  default = "ssh_key"
  type = "string"
}
