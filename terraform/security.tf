resource "aws_security_group" "sg_1" {
  name = "default"

  ingress {
    description = "App Port"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "kimang_key_2" {
  key_name   = "kimang-key-2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDI+9lix2cTuUz3s8amgF1SoP2wuqY0il+xsQU+Mw2gCHfe9hfWZ5osYSf2DRDpx7V8YsZmHzu62u+kIZ09Pwebqonfb6+gHTVHYy1B5jhghhryE6a3IRfwFo0rQnJRn3OjciDkS7fUZ2f3NFPy4Xxp24vr5YNDUOvjAxOU5IlXdIm1SeMSXMyh3gNTHz7pDN8i4NICxSk0ieqvjQaZDNJwwJRbujcrtyPcODTDxSZM5JvtVbWmJ8hwqDKfgTLjmjY8kHUTj2FOU25i8xErmkSLqx3sTJei61kT8MS+GIBhbJTJj8XSNYivlo/J6ZUH04GIoyIv+XSvMk2UsadAJ1jd kimang@KIMs-MacBook-Pro.local"
}

resource "aws_instance" "server_1" {
  ami  = "ami-000001"
  instance_type = "t3.micro"
  count = 1
  key_name = aws_key_pair.kimang_key_2.key_name
  security_groups = [aws_security_group.sg_1.name]
}