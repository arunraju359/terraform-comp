resource "aws_instance" "test" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  subnet_id   = element (aws_subnet.private.*.id[0])


  tags = {
    Name = "Test-Machine-Comp"
  }
}