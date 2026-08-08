output "instance_ids" {
  value = aws_instance.my_instance[*].id
}
output "instance_public_ips" {
  value = aws_instance.my_instance[*].public_ip
}
output "instance_private_ips" {
  value = aws_instance.my_instance[*].private_ip
}
output "instance_public_dns" {
  value = aws_instance.my_instance[*].public_dns
}
output "instance_private_dns" {
  value = aws_instance.my_instance[*].private_dns
}

output "VPC_ID" {
  value = aws_default_vpc.default.id
}
