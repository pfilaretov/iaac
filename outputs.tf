output "public_dns" {
  value = "${aws_instance.iaac-example.public_dns}:${aws_security_group.http.ingress.from_port}/api/v1/howdy?IaaC"
}