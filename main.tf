resource "aws_instance" "example" {
  ami = "ami-09420243907777c4a"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "terraform-example"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, WOeld" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  user_data_replace_on_change = true
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}