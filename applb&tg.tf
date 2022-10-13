#### TARGET GROUP #####

resource "aws_lb_target_group" "targetgroup-assign-3" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "targetgroup-terraform-assign-3"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "vpc-0af3a90700b60d193"

  tags = {
    "Assignment-3" = "target-group-terraform"
  }
}

### ALB

resource "aws_alb" "alb-terraform-assign-3" {
  name               = "alb-terraform-assign-3"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = ["sg-04c94479b226260fb"]
  subnets            = ["subnet-020daa10b818de360", "subnet-09129f1895f549b6f"]

  tags = {
    "Assignment-3" = "alb-terraform"
  }
}

resource "aws_alb_listener" "alb-listener-assign-3" {
  load_balancer_arn = aws_alb.alb-terraform-assign-3.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.targetgroup-assign-3.arn
    type             = "forward"
  }
}
