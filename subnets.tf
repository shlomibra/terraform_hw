// create a dedicated subnet
resource "aws_subnet" "subnet-uno" {
  cidr_block = "${cidrsubnet(aws_vpc.hw-env.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.hw-env.id}"
  availability_zone = "us-west-1b"
}

// create routing table which points to the internet gateway
resource "aws_route_table" "route-table-hw-env" {
  vpc_id = "${aws_vpc.hw-env.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.hw-env-gw.id}"
  }
tags = {
    Name = "hw-env-route-table"
  }
}

// associate the routing table with the subnet
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-uno.id}"
  route_table_id = "${aws_route_table.route-table-hw-env.id}"
}