
output "instance_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.flask_instances.public_ip
}

output "app_url" {
  description = "URL to access the Flask app"
  value       = "http://${aws_instance.flask_instances.public_ip}:5000"
}
