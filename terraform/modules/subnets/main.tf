# This module will build one public subnet and an arbitrary number of 
# private subnets as defined in the configuration. This module will also
# build all required routing infrastructure.

# Build public subnet.
resource "aws_subnet" "public" {
  vpc_id            = var.vpc["vpc_id"]
  cidr_block        = var.public.subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    Name = var.public.subnet_name
  }
}

# Build route table for public subnet.
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc["vpc_id"]

  tags = {
    Name = "public-${var.subnet_az}"
  }
}

# Add a default route to the public route table pointing to IGW.
resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.vpc["igw_id"]
}

# Attach the public subnet to the public RTB.
resource "aws_route_table_association" "rt_assn" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route_table.id
}

/* 
Private subnets are disabled due to AWS resource cost and not 
required for Lemony. I have left the code here commented out
to serve as an example.

# Build route table for private subnet.
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc["vpc_id"]

  tags = {
    Name = "private-${var.subnet_az}"
  }
}

# Create an EIP for use with the NAT Gateway.
resource "aws_eip" "nat" {
  vpc = true
}

# Create a NAT gateway.
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "natgw-${var.subnet_az}"
  }
}

# Add a default route to the private route table pointing to NAT GW.
resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id
}

# Create the rest of the private subnets.
resource "aws_subnet" "private" {
  count             = length(var.private)
  vpc_id            = var.vpc["vpc_id"]
  cidr_block        = lookup(var.private[count.index], "subnet_cidr")
  availability_zone = var.subnet_az

  tags = {
    Name = lookup(var.private[count.index], "subnet_name")
  }
}

# Attach private subnets to the private route
resource "aws_route_table_association" "rt_assn_private" {
  count          = length(var.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}
*/
