provider "aws" {
    region = var.region
}

resource "aws_security_group" "flask_app_sg" {
    name = "flask_app_sg"
    description = "Allow Flask website port"

    ingress {
        from_port   = var.ingressFromPort
        to_port     = var.ingressToPort
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = var.egressFromPort
        to_port     = var.egressToPort
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "flask_instances" {
    ami             = var.ami
    instance_type   = var.instance_type
    key_name        = var.key_name
    security_groups = [aws_security_group.flask_app_sg.name]

    user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install docker.io -y
              sudo systemctl start docker
              sudo docker pull kladdad/my-python-calculator-web:latest
              sudo docker run -d -p 5000:5000 kladdad/my-python-calculator-web:latest
              EOF

    tags = {
        Name = "FlaskCalculatorApp"
    }

}
