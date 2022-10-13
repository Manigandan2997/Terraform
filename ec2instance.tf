resource "aws_instance" "plain-ec2-instance" {
  ami                    = "ami-09208e69ff3feb1db"
  instance_type          = "t2.micro"
  count                  = 2
  availability_zone      = "us-west-1b"
  key_name               = "devops"
  vpc_security_group_ids = ["sg-0830bea3e31903da1"]
  tags = {
    "Name"         = "myfirst-instance"
    "Assignment-3" = "plain-ec2-instance"
  }

}

