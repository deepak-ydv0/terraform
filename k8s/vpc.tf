module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = local.private_subnet
  public_subnets  = local.public_subnet
  intra_subnets   = local.intera_subnet

  enable_nat_gateway = true
  enable_vpn_gateway = true


  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
