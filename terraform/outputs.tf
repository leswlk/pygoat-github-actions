output "pygoat_public_ip" {
  value = aws_instance.pygoat.public_ip
}

output "pygoat_url" {
  value = "http://${aws_instance.pygoat.public_ip}:5000"
}

output "security_group_id" {
  value = aws_security_group.pygoat_sg.id
}

