variable "vpc_id-main" {
  description = "private subnet"
  type = string

}
#--------------public subnet----------------------
variable "publicsubnet-id" {
  description = "public subnet"
  type = string
}
variable "tag-publicSubnet" {
  description = "public subnet tag name"
  type = string
}
#--------------private subnet-----------------------
variable "privatesubnet2" {
  description = "private subnet"
  type = string
}
variable "tag-privateSubnet" {
  description = "private subnet tag name"
  type = string
}

#-------------- route table-----------------------

variable "publicroute" {
  description = "public route table"
  type = string
}
variable "privateroute" {
  description = "private route table"
  type = string
}
#-------------- internate gateway-----------------------
variable "mygateway" {
  description = "private route table"
  type = string
}
#--------------------nat gateway---------------------------
variable "nat-gateway" {
  description = "nat gatway route table"
  type = string
 
}