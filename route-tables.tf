#
# public subnets route table
#
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "${var.account-shortname}-public-rtb"
  }
}
#
# private subnets route table
#
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "${var.account-shortname}-private-rtb"
  }
}
#
# data subnets route table
#
resource "aws_route_table" "data" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "${var.account-shortname}-data-rtb"
  }
}
