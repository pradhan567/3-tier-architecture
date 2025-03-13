# filepath: c:\Users\mpradha\Documents\kodekloud\Terraform_learning\3-tier-architecture\modules\security-groups\main.tf
resource "aws_security_group" "bastian-sg" {
  name        = var.name
  description = "Security group for bastian host"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.cidr_ipv4]
  }

  egress {
    from_port = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_all]
  }

  tags = {
    Name = "bastian-sg"
  }
}