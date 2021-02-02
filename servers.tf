// create Amazon linux instances 
resource "aws_instance" "hw-ec2-instance" {
  ami           = "ami-005c06c6de69aee84"
  instance_type = "t2.micro"
  key_name      = "MyKeyPair"
  security_groups = ["${aws_security_group.ingress-all-hw.id}"]
  subnet_id = "${aws_subnet.subnet-uno.id}"
  user_data = "${data.template_file.user_data.rendered}"
}

data "template_file" "user_data" {
  template = "${file("templates/user_data.tpl")}"
}

output "ip" {
  description = "The public ip for the linux vm via ssh access"
  value = aws_eip.ip-hw-env.public_ip
}




