#To specify AWS region
provider "aws" {
  region = "us-east-1"
}

#Internet VPC
resource "aws_vpc" "svunnamVPC" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags {
    Name = "svunnamVPC"
  }
}
#subnets
resource "aws_subnet" "svunnam-public-1" {
  vpc_id = "${aws_vpc.svunnamVPC.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags {
    Name = "svunnam-public-1"
  }
}

#subnets
resource "aws_subnet" "svunnam-public-2" {
  vpc_id = "${aws_vpc.svunnamVPC.id}"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags {
    Name = "svunnam-public-2"
  }
}

#subnets
resource "aws_subnet" "svunnam-private-1" {
  vpc_id = "${aws_vpc.svunnamVPC.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1a"
  tags {
    Name = "svunnam-private-1"
  }
}

#subnets
resource "aws_subnet" "svunnam-private-2" {
  vpc_id = "${aws_vpc.svunnamVPC.id}"
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"
  tags {
    Name = "svunnam-private-2"
  }
}

#internet Gateway
resource "aws_internet_gateway" "svunnamIGW" {
  vpc_id = "${aws_vpc.svunnamVPC.id}"
  tags {
    Name = "svunnamIGW"
  }
}
  
output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.svunnamVPC.*.id, [""])[0]
}
