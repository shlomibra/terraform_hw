// create the internet gateway
resource "aws_internet_gateway" "hw-env-gw" {
  vpc_id = "${aws_vpc.hw-env.id}"
tags = {
    Name = "hw-env-gw"
  }
}