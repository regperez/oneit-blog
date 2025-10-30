variable "vm_user" {
  description = "Usuario SSH para la VM"
  type        = string
  default     = "gcpuser"
}

variable "public_key_path" {
  description = "Ruta de la llave pública SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

