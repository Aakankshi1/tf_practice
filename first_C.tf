#provider "aws"{
#    region = "us-east-2"
#    access_key = "AKIAZ6WPPKYL27WDMAHM"
#    secret_key = "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"
#}

#resource "aws_key_pair" "tf" {
#   key_name = "tf"
#   public_key = "${file("/root/.ssh/id_rsa.pub")}"
#}

#resource "aws_instance" "tf_test"{
#    ami = "ami-04768381bf606e2b3"
#    instance_type = "t2.micro"
#    key_name = "${aws_key_pair.tf.key_name}"
#    user_data = "${file("install_ssm.sh")}" 
#    tags = {
#    Name = "tf_test"
#    }
#    iam_instance_profile = "SSMRoleForEC2"
#}

