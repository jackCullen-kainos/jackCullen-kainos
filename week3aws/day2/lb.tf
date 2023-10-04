resource "aws_lb" "loadbalancer" {
    name = "lb-jc"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.sg.id]
    subnets = [aws_subnet.serversubnet1.id,aws_subnet.serversubnet2.id]
    
    enable_deletion_protection = true
  
}