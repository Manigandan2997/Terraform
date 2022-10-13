resource "aws_instance" "httpd-server" {
  ami                    = "ami-09208e69ff3feb1db"
  instance_type          = "t2.micro"
  availability_zone      = "us-west-1c"
  key_name               = "devops"
  vpc_security_group_ids = ["sg-0ec71ac874e2d039e"]
  user_data              = <<-EOF

    #!/bin/bash
    sudo su -
    yum update -y
    yum install httpd -y
    systemctl enable httpd
    systemctl start httpd
    cd /var/www/html
    echo 'Assignment-3 -Hello Devops Team. Succesfully accessed the httpd web page. Here, The resources are created by terraform scripts' > index.html
    
    EOF


  tags = {
    "Name"         = "httpdserver-by-terraform-script"
    "Assignment-3" = "Httpd-server by terraform"
  }

}