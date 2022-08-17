resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  count = length(var.PUBLIC_CIDR)

  cidr_block = element (var.PUBLIC_CIDR, count.index)

  tags = {
    Name = "Public-Subnet-${count.index + 1}"
  }
}


resource "aws_subnet" "private" {
vpc_id     = aws_vpc.main.id
count = length(var.PRIVATE_CIDR)

cidr_block = element (var.PRIVATE_CIDR, count.index)

  tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }
}