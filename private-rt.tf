resource "aws_route_table" "terraform-private-rt-1" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat-gw.id
  }

  tags = {
    Name = "terraform-private-rt-1"
  }
}

resource "aws_route_table" "terraform-private-rt-2" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat-gw-2.id
  }

  tags = {
    Name = "terraform-private-rt-2"
  }
}