output "prod-web01" {
  value = "${aws_instance.web.public_ip}"
}

output "prod-web2" {
  value = "${aws_instance.postgres.public_ip}"
}
