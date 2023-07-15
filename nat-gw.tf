resource "aws_eip" "terraform-eip" {
  domain      = "vpc"
}

resource "aws_eip" "terraform-eip-2" {
  domain      = "vpc"
}

resource "aws_nat_gateway" "terraform-nat-gw" {
  allocation_id = aws_eip.terraform-eip.id
  subnet_id     = aws_subnet.terraform-public-subnet-2.id

  tags = {
    Name = "terraform-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terraform-igw]
}

resource "aws_nat_gateway" "terraform-nat-gw-2" {
  allocation_id = aws_eip.terraform-eip-2.id
  subnet_id     = aws_subnet.terraform-public-subnet-1.id

  tags = {
    Name = "terraform-nat-gw-2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.terraform-igw]
}