variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "Name for the SSH key pair"
  default     = "pygoat-key"
}

variable "public_key_path" {
  description = "Path to your local public key (e.g., ~/.ssh/id_rsa.pub)"
  default     = "~/.ssh/id_rsa.pub"
}
 variable "allowed_ip" {
   description = "Your IP address for SSH and Pygoat access"
   default     = "0.0.0.0/0" #Change to your IP for security
 }
