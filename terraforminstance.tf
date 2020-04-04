provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}

resource "aws_instance" "terrafromInstance" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

# Create a VPC
resource "aws_vpc" "svunnamVPC" {
  cidr_block = "10.0.0.0/16"
  
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["172.19.40.0/24", "10.0.3.0/24"]
  public_subnets = ["10.0.1.0/24", "10.0.4.0/24"]
}
