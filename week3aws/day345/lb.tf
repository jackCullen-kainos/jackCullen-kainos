resource "aws_lb" "lb" {
  name               = "lb-jc"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.pub-sub-a.id, aws_subnet.pub-sub-b.id]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-target-gp.arn
  }
  depends_on = [aws_acm_certificate_validation.cert-validation]
}

resource "aws_lb_target_group" "lb-target-gp" {
  name     = "lb-tg-jc"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path                = "/index.html"
    port                = 80
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }
}

resource "aws_lb_target_group_attachment" "tg-attach" {
  count = length(concat(aws_instance.cluster-zone-a[*].id, aws_instance.cluster-zone-b[*].id))

  target_group_arn = aws_lb_target_group.lb-target-gp.arn
  target_id        = concat(aws_instance.cluster-zone-a[*].id, aws_instance.cluster-zone-b[*].id)[count.index]
  port             = 80

}


