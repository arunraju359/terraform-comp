resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

   tags = {
    Name = "public-route"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }
   tags = {
    Name = "private-route"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.PUBLIC_CIDR)
  subnet_id      = element (aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.PRIVATE_CIDR)
  subnet_id      = element (aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}