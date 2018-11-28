variable "my_public_key_path" {
  description = "provide the path where your ssh public key is"
  default     = "~/.ssh/id_rsa.pub"
}

variable "my_private_key_path" {
  description = "provide the path where your ssh private key is"
  default     = "~/.ssh/id_rsa"
}
