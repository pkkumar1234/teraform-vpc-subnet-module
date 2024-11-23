resource "aws_vpc" "main" {
  cidr_block       =var.loc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name =var.loc_tags
  }
}
