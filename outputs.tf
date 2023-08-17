output "public_ip" {
  value = aws_autoscaling_group.example.name
  description = "The public IP address of the web server"
}
