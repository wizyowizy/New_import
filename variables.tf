variable "my_ip" {
   description = "My Static IP address"
   type = string
   sensitive = true
}

variable "region" {
   description = "Define the region where AWS service is provisioned"
   default = "us-east-2"
   }


variable "ip" {
  description = "ip address for my workstation"
  type        = string
  default     = "158.272.8.178"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "t2.micro"
}
