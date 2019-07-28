data "aws_" "ami1"
{
  most_recent = true
  owners = ["self"]
  
  filter
  {
    name = "state"
    values = ["available"]
  }

  filter
  {
    name = "tag:Name"
    values = ["RHEL7"]
  }
}
