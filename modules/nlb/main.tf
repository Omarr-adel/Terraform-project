resource "aws_lb" "this" {
  name               = var.lb_name
  load_balancer_type = "network"
  subnets            = var.subnets
}

resource "aws_lb_target_group" "this" {
  name     = var.lb_name
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

output "lb_dns" {
  value = aws_lb.this.dns_name
}
