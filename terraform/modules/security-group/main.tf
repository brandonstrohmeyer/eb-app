// Build security group
resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc["vpc_id"]

  tags = {
    Name = var.name
  }
}

// Iterate over provided list of rules and attach to the security group
resource "aws_security_group_rule" "this" {
  count                    = length(var.rules)
  type                     = lookup(var.rules[count.index], "type")
  description              = lookup(var.rules[count.index], "description")
  from_port                = lookup(var.rules[count.index], "from_port")
  to_port                  = lookup(var.rules[count.index], "to_port")
  protocol                 = lookup(var.rules[count.index], "protocol")
  cidr_blocks              = lookup(var.rules[count.index], "cidr", null)
  source_security_group_id = lookup(var.rules[count.index], "source_sg", null)
  security_group_id        = aws_security_group.this.id
}
