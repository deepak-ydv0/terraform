locals {
  region         = "ap-south-1"
  name           = "eks-cluster"
  vpc_cidr       = "10.0.0.0/16"
  public_subnet  = ["10.0.1.0/24"]
  private_subnet = ["10.0.101.0/24"]
  env            = "dev"
  azs            = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  intera_subnet  = ["10.0.5.0/24", "10.0.6.0/24"]

}
