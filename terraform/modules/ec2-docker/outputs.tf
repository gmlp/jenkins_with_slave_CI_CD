output "ci_server_public_ip" {
  value = "${aws_instance.ci_server.public_ip}"
}

output "ci_server_id" {
  value = "${aws_instance.ci_server.id}"
}
