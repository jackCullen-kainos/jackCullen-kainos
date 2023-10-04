output "pubip1" {
  value = aws_instance.inst1.public_ip
}

output "pubip2" {
  value = aws_instance.inst2.public_ip
}