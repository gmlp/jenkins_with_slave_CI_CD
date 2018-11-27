variable "instance_type" {
  default = "t2.micro"
}

variable "instance_profile_name" {
  default = ""
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "security_group_ids" {
  default = ""
}

variable "key_name" {
  default = ""
}

variable "key_path" {
  default = ""
}

variable "docker_volume_size" {
  default = "22"
}

variable "swap_volume_size" {
  default = "4"
}

variable "tags" {
  default = {}
}