resource "aws_alb" "terraform-ALB-1" {
  name               = "terraform-ALB-1"
  internal           = false
  security_groups    = [aws_security_group.terraform-ALB-sg.id]
  subnets            = [aws_subnet.terraform-public-subnet-1.id, aws_subnet.terraform-public-subnet-2.id]

  enable_deletion_protection = false


  tags = {
    Name = "terraform-ALB"
  }
}

#creating target group
resource "aws_lb_target_group" "terraform-TG" {
  name     = "terraform-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.example.id
}

#create alb listener

resource "aws_lb_listener" "terraform-alb-listener" {
  load_balancer_arn = aws_alb.terraform-ALB-1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform-TG.arn
  }
}