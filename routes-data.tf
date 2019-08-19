resource "aws_route" "data-default" {
  count = "${var.nat_gateway}"
  route_table_id = "${aws_route_table.data.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.ngw[0].id}"
}
