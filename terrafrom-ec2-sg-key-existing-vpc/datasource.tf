data "aws_subnet" "subnet" {
  filter {
    name = "tag:Name"
    values = ["dev-levelup-vpc-public-subnet-1"]
  }
}

output "subnet" {
  value = data.aws_subnet.subnet.id
}


data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["dev-vpc"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
data "aws_availability_zones" "available" {
  state = "available"
}