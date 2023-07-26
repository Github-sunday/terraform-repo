resource "aws_subnet" "terraform-public-subnet-1" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public-subnet-1"
  }
}

resource "aws_subnet" "terraform-public-subnet-2" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform-public-subnet-2"
  }
}