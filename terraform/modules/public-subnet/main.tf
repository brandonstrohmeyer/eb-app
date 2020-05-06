// Build public subnet
resource "aws_subnet" "public" {
  vpc_id            = var.vpc["vpc_id"]
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    Name = var.subnet_name
  }
}

// Build route table for public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc["vpc_id"]

  tags = {
    Name = "public-${var.subnet_az}"
  }
}

// Add a default route to the public route table pointing to IGW
resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.vpc["igw_id"]
}

// Attach the public subnet to the public RTB
resource "aws_route_table_association" "rt_assn" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route_table.id
}
