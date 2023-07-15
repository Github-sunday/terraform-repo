resource "aws_route_table_association" "terraform-private-subnet-1-association" {
  subnet_id      = aws_subnet.terraform-private-subnet-1.id
  route_table_id = aws_route_table.terraform-private-rt-1.id
}

resource "aws_route_table_association" "terraform-private-subnet-2-association" {
  subnet_id      = aws_subnet.terraform-private-subnet-2.id
  route_table_id = aws_route_table.terraform-private-rt-2.id
}