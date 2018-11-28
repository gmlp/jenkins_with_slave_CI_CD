variable "my_private_key_path" {
  description = "provide the path where your ssh private key is"
  default     = "~/.ssh/id_rsa"
}

variable "jenkins_user" {
  default = "admin"
}

variable "jenkins_pass" {
  default = "admin"
}

