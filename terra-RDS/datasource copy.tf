data "aws_subnet" "private-subnet-1" {
  vpc_id = "${data.aws_vpc.selected.id}"
   tags = {
    Name = "name-private-us-west-2c"
  }
}

data "aws_subnet" "private-subnet-2" {
  vpc_id = "${data.aws_vpc.selected.id}"
   tags = {
    Name = "name-private-us-west-2b"
  }
}


#data "aws_subnet" "example" {
 # for_each = data.aws_subnet_ids.example.ids
  #id       = each.value
#}

#output "subnet_cidr_blocks" {
 # value = [for s in data.aws_subnet.example : s.cidr_block]


#}

data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["name"]
  }
}
