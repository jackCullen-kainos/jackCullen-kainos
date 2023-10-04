output "instip-cluster-a" {
  value = aws_instance.cluster-zone-a[*].public_ip
}

output "instip-cluster-b" {
  value = aws_instance.cluster-zone-b[*].public_ip
}