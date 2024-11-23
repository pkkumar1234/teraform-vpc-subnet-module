# Create Public Subnet
resource "aws_subnet" "publicsubnet" {
  vpc_id     = var.vpc_id-main
  cidr_block = var.publicsubnet-id

  tags = {
    Name = var.tag-publicSubnet
  }
}
# Create Private Subnet
resource "aws_subnet" "privatesubnet2" {
  vpc_id     = var.vpc_id-main
  cidr_block = var.privatesubnet2

  tags = {
    Name = var.tag-privateSubnet
  }
}
# Create Public Route Table and associate internet gateway 
resource "aws_route_table" "pubrout1" {
  vpc_id = var.vpc_id-main

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.publicroute
  }
}
# Create Private Route Table
resource "aws_route_table" "privrout2" {
  vpc_id = var.vpc_id-main

  tags = {
    Name = var.privateroute
  }
   route{
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}
# Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id-main

  tags = {
    Name = var.mygateway
  }
}
# Associate route table to public subnet
resource "aws_route_table_association" "asscipublic" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.pubrout1.id
}
# Associate route table to private subnet
resource "aws_route_table_association" "assciprivate" {
  subnet_id      = aws_subnet.privatesubnet2.id
  route_table_id = aws_route_table.privrout2.id
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  tags = {
    Name = "NAT Gateway Elastic IP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.publicsubnet.id

  tags = {
    Name = var.nat-gateway
  }
}

