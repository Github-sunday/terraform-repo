resource "aws_launch_template" "terraform-bastion-launch-template" {
  name_prefix   = "terraform-bastion-launch-template"
  image_id      = "ami-0b026d11830afcbac"
  instance_type = "t2.micro"
  key_name = "trial-key-pair"
  user_data = filebase64("code-deploy/code-deploy.sh")

  vpc_security_group_ids = [aws_security_group.terraform-bastion-sg.id]

    iam_instance_profile {
    name = "ec2-code-deploy"
  }
}

resource "aws_autoscaling_group" "terraform-bastion-auto-scaling-2" {
  vpc_zone_identifier = [aws_subnet.terraform-public-subnet-2.id]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  health_check_grace_period = 300
  health_check_type = "EC2"


  launch_template {
    id      = aws_launch_template.terraform-bastion-launch-template.id
    version = "$Latest"
  }
}