resource "aws_subnet" "terraform-private-subnet-1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "terraform-private-subnet-1"
  }
}

resource "aws_subnet" "terraform-private-subnet-2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "terraform-private-subnet-2"
  }
}