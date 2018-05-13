output "prod-web" {
  value = "${aws_instance.web.*.public_ip}"
}

output "prod-db" {
  value = "${aws_instance.postgres.*.public_ip}"
}

output "prod-log" {
  value = "${aws_instance.logstash.*.public_ip}"
}

output "prod-kibana" {
  value = "${aws_instance.kibana.*.public_ip}"
}


output "prod-elastic" {
  value = "${aws_instance.elastic.*.public_ip}"
}


