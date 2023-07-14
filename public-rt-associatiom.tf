resource "aws_route_table_association" "terraform-public-subnet-1-association" {
  subnet_id      = aws_subnet.terraform-public-subnet-1.id
  route_table_id = aws_route_table.terraform-public-rt.id
}

resource "aws_route_table_association" "terraform-public-subnet-2-association" {
  subnet_id      = aws_subnet.terraform-public-subnet-2.id
  route_table_id = aws_route_table.terraform-public-rt.id
}