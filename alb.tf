resource "aws_lb_listener_rule" "host_based_weighted_routing" {
  listener_arn = data.terraform_remote_state.frontend.outputs.BACKEND_LB_LISTENER_ARN
  priority     = 97

  action {
    type             = "forward"
    target_group_arn = module.asg.TG_ARN
  }

  condition {
    host_header {
      values = ["${var.COMPONENT}-${var.ENV}.devopsb52.internal"]
    }
  }
}
