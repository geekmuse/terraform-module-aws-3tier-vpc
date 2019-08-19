resource "aws_subnet" "public" {
  count = "${length(local.az_letters)}"
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, count.index)}"
  availability_zone = "${var.aws_region}${local.az_letters[count.index]}"
  tags = {
    Name = "${var.account-shortname}-public-${substr(join("", [var.aws_region, element(local.az_letters, count.index)]), -2, 2)}"
    Tier = "public"
  }
}

resource "aws_subnet" "private" {
  count = "${length(local.az_letters)}"
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, length(local.az_letters) + count.index)}"
  availability_zone = "${var.aws_region}${local.az_letters[count.index]}"
  tags = {
    Name = "${var.account-shortname}-private-${substr(join("", [var.aws_region, element(local.az_letters, count.index)]), -2, 2)}"
    Tier = "private"
  }
}

resource "aws_subnet" "data" {
  count = "${length(local.az_letters)}"
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(var.vpc_cidr, 4, (length(local.az_letters) * 2) + count.index)}"
  availability_zone = "${var.aws_region}${local.az_letters[count.index]}"
  tags = {
    Name = "${var.account-shortname}-data-${substr(join("", [var.aws_region, element(local.az_letters, count.index)]), -2, 2)}"
    Tier = "data"
  }
}
