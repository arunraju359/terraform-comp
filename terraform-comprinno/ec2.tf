resource "aws_instance" "test" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_id            = aws_vpc.main.id
  cidr_block        = element (var.PRIVATE_CIDR, 0)


  tags = {
    Name = "Test-Machine-Comp"
  }
}