resource "aws_launch_template" "terraform-launch-template" {
  name_prefix   = "terraform"
  image_id      = "ami-0b026d11830afcbac"
  instance_type = "t2.micro"
  key_name = "trial-key-pair"

  vpc_security_group_ids = [aws_security_group.terraform-instance-sg.id]

    iam_instance_profile {
    name = "ec2-code-deploy"
  }
}

resource "aws_autoscaling_group" "terraform-auto-scaling-3" {
  vpc_zone_identifier = [aws_subnet.terraform-private-subnet-1.id, aws_subnet.terraform-private-subnet-2.id]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  health_check_grace_period = 300
  health_check_type = "ELB"


  launch_template {
    id      = aws_launch_template.terraform-launch-template.id
    version = "$Latest"
  }
}

#create auto scaling attachment

resource "aws_autoscaling_attachment" "terraform-auto-scaling-attachment" {
  autoscaling_group_name = aws_autoscaling_group.terraform-auto-scaling-3.id
  lb_target_group_arn    = aws_lb_target_group.terraform-TG.arn
}