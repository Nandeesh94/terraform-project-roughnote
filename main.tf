provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
ami = "ami-0ca9fb66e076a6e32"
instance_type = "t2.micro"
key_name = "swiggynewkeypair"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "us-east-1a"
user_data = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my app created by terraform infrastructure by raham sir server-1" >/var/www/html/index.html
EOF
tags = {
Name = "web_server-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0ca9fb66e076a6e32"
instance_type = "t2.micro"
key_name = "swiggynewkeypair"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "us-east-1b"
user_data = <<EOF
#!/bin/bash
sudo - i
yum install httpd - y
systemctl start httpd 
chkconfig httpd on
echo "hai all this is my app  created by terraform infrastructure by raham sir server-2" >/var/www/html/index.html
EOF
tags = {
Name = "web_server-2"
}
}

resource "aws_instance" "three" {
ami = "ami-0ca9fb66e076a6e32"
instance_type = "t2.micro"
key_name = "swiggynewkeypai"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "us-east-1a"
tags = {
Name = "app_server-1"
}
}

resource "aws_instance" "four" {
ami = "ami-0ca9fb66e076a6e32"
instance_type = "t2.micro"
key_name = "swiggynewkeypair"
vpc_security_group_ids = [aws_security_group.five.id]
tags = {
Name = "app_server-2"
}
}

resource "aws_security_group" "five" {
name = "elb-sg1"
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_s3_bucket" "six" {
bucket = "devopsbynandeeshterraformbucket80953"
}

resource "aws_iam_user" "seven" {
for_each = var.user_names
name = each.value
}

variable "user_names" {
description = "*"
type = set(string)
default = ["user1", "user2", "user3", "user4"]
}

resource "aws_ebs_volume" "eight" {
availability_zone = "us-east-1a"
size = 30
tags = {
Name = "ebs-001"
}
}

