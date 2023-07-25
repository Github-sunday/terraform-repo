resource "aws_network_acl" "terraform-nacl" {
  vpc_id = aws_vpc.example.id

  # Ingress rule
  ingress {
    protocol    = "tcp"
    rule_no = 100
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
  }

  # Egress rule
  egress {
    protocol    = "-1"
    rule_no = 200
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
}