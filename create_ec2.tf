
##Attach ebs volume
resource "aws_volume_attachment" "ava1"
{
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.ebs1.id}"
  instance_id = "${aws_instance.ec1.id}"
}

#Create multiple ec2
resource "aws_instance" "ec1"
{
  ami = "${var.ins_ami["us-east-2c"]}" 
  instance_type = "${var.ins_type}"
#  count = 2
  key_name = "${aws_key_pair.pbk1.id}"
  subnet_id = "${aws_subnet.subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.sg1.id}"]
  user_data = "${file(var.usr_data)}"
}

##print public ip
#output "ip"
#{
#  value = "${aws_instance.ec1.public_ip}"
#}
