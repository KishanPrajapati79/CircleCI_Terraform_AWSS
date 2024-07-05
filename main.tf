provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "tfdemostatebucket"
    key    = "kishan/circleci.tfstate"
    region = "ap-south-1"
  }
}



resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}

variable "cidr" {
  default = "10.0.0.0/16"
}

resource "aws_vpc" "myvpctf" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1tf" {
  vpc_id                  = aws_vpc.myvpctf.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igwtf" {
  vpc_id = aws_vpc.myvpctf.id
}

resource "aws_route_table" "RTtf" {
  vpc_id = aws_vpc.myvpctf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwtf.id
  }
}

resource "aws_route_table_association" "rta1tf" {
  subnet_id      = aws_subnet.sub1tf.id
  route_table_id = aws_route_table.RTtf.id
}

resource "aws_security_group" "webSgtf" {
  name   = "web"
  vpc_id = aws_vpc.myvpctf.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sgtf"
  }
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}

resource "aws_instance" "server" {
  ami                    = "ami-007020fd9c84e18c7"
  instance_type          = "t2.micro"
  //key_name               = aws_key_pair.example.key_name
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.webSgtf.id]
  subnet_id              = aws_subnet.sub1tf.id
  tags = {
    Name = "TerraformInfraServer"
    // Add more tags as needed
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"                           
    private_key = tls_private_key.example.private_key_pem
    host        = self.public_ip
  }   
}




