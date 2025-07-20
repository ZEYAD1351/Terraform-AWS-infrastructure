module "ALB" {
  source = "./Modules/ALB"
  public_one = module.Subnets.public_one
  public_two = module.Subnets.public_two
  private_one = module.Subnets.private_one
  private_two = module.Subnets.private_two
  ec2_1 = module.instances.ec2_1
  ec2_2 = module.instances.ec2_2
  ec2_3 = module.instances.ec2_3
  ec2_4 = module.instances.ec2_4
  myvpc = module.vpc.myvpc.id
  sg = module.security_groups.sg 
}

module "instances" {
  source = "./Modules/Instances"
  public_one = module.Subnets.public_one
  public_two = module.Subnets.public_two
  private_one = module.Subnets.private_one
  private_two = module.Subnets.private_two
  sg = module.security_groups.sg
}

module "routing" {
  source = "./Modules/Routing"
  public_one = module.Subnets.public_one
  public_two = module.Subnets.public_two
  private_one = module.Subnets.private_one
  private_two = module.Subnets.private_two
  myvpc = module.vpc.myvpc.id

}

module "security_groups" {
  source = "./Modules/Security"
  myvpc = module.vpc.myvpc.id
}

module "Subnets" { 
  source = "./Modules/Subnets"
  myvpc = module.vpc.myvpc.id
}

module "vpc" {
  source = "./Modules/VPC"
  cidr = "10.0.0.0/16"
}

resource "local_file" "ips_file" {
  filename = "all-ips.txt"
  content  = <<-EOT
    %{for i, ip in [module.instances.ec2_proxy1, module.instances.ec2_proxy2]}
    public-ip${i + 1} ${ip}
    %{endfor~}
    %{for i, ip in [module.instances.ec2_backend2, module.instances.ec2_backend2]}
    private-ip${i + 1} ${ip}
    %{endfor}
  EOT
}