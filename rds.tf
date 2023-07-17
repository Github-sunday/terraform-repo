#create subnet group

resource "aws_db_subnet_group" "terraform-db-subnet" {
  name       = "terraform-db-subnet"
  subnet_ids = [aws_subnet.terraform-private-subnet-1.id, aws_subnet.terraform-private-subnet-2.id]

  tags = {
    Name = "terraform-db-subnet"
  }
}

#RDS

resource "aws_db_instance" "terraform-RDS" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "Faddave"
  password             = "Fadzai123"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.terraform-db-subnet.name
  availability_zone = "eu-west-2b"
  vpc_security_group_ids = [aws_security_group.terraform-RDS-sg.id]
  identifier = "terraform-db"
}