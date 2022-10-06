resource "aws_key_pair" "test_key" {
  key_name      = "test_key"
  public_key    = file(var.public_key_path)
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
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "${var.INSTANCE_TYPE}"
  key_name               = "test_key"
  monitoring             = true
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = "${data.aws_subnet.subnet.id}"
  associate_public_ip_address = true

  tags = {
    Environment = "${var.Environment}"
  }
}


resource "aws_ebs_volume" "myebs" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 10
   tags = {
    Environment = "${var.Environment}"
  }

}


resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myebs.id
  instance_id = module.ec2_instance.id
}



module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${var.Environment}"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = "${data.aws_vpc.selected.id}"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]

   tags = {
    Environment = "${var.Environment}"
  }

}


provider "aws" {
  region     = "us-west-1"
}
