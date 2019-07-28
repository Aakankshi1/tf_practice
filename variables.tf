variable "ins_type"
{
  default = "t2.micro"
}

variable "cidr_vpc"
{
  description = "CIDR For VPC"
  default = "10.0.0.0/16"
}

variable "cidr_subnet"
{
 default = "10.0.0.0/24"
}

variable "avail_zone"
{
  default = "us-east-2c"
}

variable "pub_k_path"
{
  default = "/root/.ssh/id_rsa.pub"
}

variable "ins_ami"
{
  type = "map"
  default = {
              "us-east-2c" = "ami-0b500ef59d8335eee"
              "us-west-2" = "ami-4b32be2b"
            }
}

variable "env_tag"
{
  default = "Production"
}

variable "usr_data"
{
  default = "ssm_agent.sh"
}
