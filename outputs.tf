output "public_dns" {
  value = "http://${aws_instance.iaac-example.public_dns}:7060/api/v1/howdy?name=IaaC"
}