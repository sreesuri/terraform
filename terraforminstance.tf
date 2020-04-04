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
}
