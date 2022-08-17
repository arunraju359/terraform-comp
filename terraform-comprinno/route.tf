resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.PUBLIC_CIDR
    gateway_id = aws_internet_gateway.igw.id
  }

   tags = {
    Name = "public-route"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.PRIVATE_CIDR
    gateway_id = aws_nat_gateway.ngw.id
  }
   tags = {
    Name = "private-route"
  }
}