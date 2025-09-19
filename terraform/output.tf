output "instances_ip" {
    description = "The public IP addresses of the instances"
    value       = aws_instance.server_1.*.public_ip
}