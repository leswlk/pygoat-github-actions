provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "pygoat_sg" {
  name        = "pygoat_sg"
  description = "Allow SSH and PyGoat access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    description = "PyGoat web"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "PyGoatSG" }
}

# EC2 Instance
resource "aws_instance" "pygoat" {
  ami           = "ami-0c94855ba95c71c99"  # Update for your region
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.pygoat_sg.name]

  tags = { Name = "PyGoatServer" }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y python3 git",
      "git clone https://github.com/OWASP/PyGoat.git /home/ec2-user/PyGoat",
      "cd /home/ec2-user/PyGoat && python3 -m pip install -r requirements.txt",
      "nohup python3 /home/ec2-user/PyGoat/app.py &"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}

