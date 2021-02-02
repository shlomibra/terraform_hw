// create a security group for ssh access to the linux systems
resource "aws_security_group" "ingress-all-hw" {
name = "allow-all-sg"
vpc_id = "${aws_vpc.hw-env.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// allow access to the internet
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}