resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "${var.account-shortname}-igw"
  }
}

resource "aws_eip" "ngw_eip" {
  count = "${var.nat_gateway}"
  vpc = true
  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_nat_gateway" "ngw" {
  count = "${var.nat_gateway}"
  allocation_id = "${aws_eip.ngw_eip[0].id}"
  subnet_id = "${aws_subnet.public[0].id}"
  tags = {
    Name = "${var.account-shortname}-ngw"
  }
  depends_on = ["aws_internet_gateway.igw"]
}
