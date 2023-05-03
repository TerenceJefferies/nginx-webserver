output "server_url" {
  value = "http://${aws_instance.web.public_ip}"
}
