# Create EC2 instance with SSM access and Jenkins server tag
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"  # Change instance type as needed
  key_name = "mykey"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]  # Change this to reference security group IDs

  for_each = toset(["jenkins-master", "build-slave", "ansible"])
  tags = {
    Name = "${each.key}"
  }
}


