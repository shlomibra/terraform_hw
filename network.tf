// create the virtual private network
resource "aws_vpc" "hw-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "hw-env"
  }
}
resource "aws_eip" "ip-hw-env" {
  instance = "${aws_instance.hw-ec2-instance.id}"
  vpc      = true
}