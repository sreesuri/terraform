provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "terrafromInstance" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

resource "aws_eip" "nat" {
  count = 1

  vpc = true
  tags = {

    Name = "svunnam-eks-nat-gw"
  }

}
module "vpc" {
 
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 2.6"

  name = "svunnam_eks"

  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]
  public_subnets = ["10.0.1.0/24", "10.0.3.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module

  tags = {
    
    Environment = "PoC"
    Stack = "Spotinst"
  }

  vpc_tags = {
    Name = "svunnam_eks"
  }
}
