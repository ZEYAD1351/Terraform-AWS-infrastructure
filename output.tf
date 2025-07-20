output "public1_ip" {
  value = module.instances.ec2_proxy1
}

output "public2_ip" {
  value = module.instances.ec2_proxy2
}

output "private1_ip" {
  value = module.instances.ec2_backend1
}
output "private2_ip" {
  value = module.instances.ec2_backend2
}