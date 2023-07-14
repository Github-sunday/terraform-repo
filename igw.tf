resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = aws_vpc.example.id

  tags = {
    Name = "terraform-igw"
  }
}