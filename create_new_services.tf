##Configure the aws provider
provider "aws" 
{
  region = "us-east-2"
  access_key = "#######"
  secret_key = "#######"
}

##Create a VPC
resource "aws_vpc" "vpc1"
{
  cidr_block = "10.0.0.0/16"
#  enable_dns_support = "true"
#  enable_dns_hostnames = "true"
  tags = {
           "Environment" = "${var.env_tag}"
           "Name" = "vpc1"
         }
}

##Create IGW
resource "aws_internet_gateway" "igw1"
{
  vpc_id = "${aws_vpc.vpc1.id}"
  tags = {
          "Environment" = "${var.env_tag}"
        }
}

##Create a new Public Subnet
resource "aws_subnet" "subnet1"
{
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "${var.cidr_subnet}"
#  map_public_ip_on_launch = "true"
  availability_zone = "${var.avail_zone}"
  tags = {
           "Name" = "subnet1"
         }
}

##Create Route Table
resource "aws_route_table" "rt_pub"
{
  vpc_id = "${aws_vpc.vpc1.id}"
  route
  {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw1.id}"
  }
  tags
  {
    "Environment" = "${var.env_tag}"
  }
}

##Associate RT with Subnet
resource "aws_route_table_association" "rta1"
{
  subnet_id = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.rt_pub.id}"
}

##Create Security Group
resource "aws_security_group" "sg1"
{
  name = "sg1"
  vpc_id = "${aws_vpc.vpc1.id}"
  
  ingress
  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress
  {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags
  {
    "Environment" = "${var.env_tag}"
  }
}

##Creating key-pair
resource "aws_key_pair" "pbk1"
{
  key_name = "pbk1"
  public_key = "${file(var.pub_k_path)}"
}

##Create IP for NAT
#resource "aws_eip" "Nat1"
#{
#  count = 3
#  vpc = true
#}

##Create EBS volume in GB
#resource "aws_ebs_volume" "ebs1"
#{ 
#  availability_zone = "us-west-2a"
#  size              = 1
#}
