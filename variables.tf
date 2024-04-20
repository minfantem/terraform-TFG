variable "paris_cidr" {
  description = "CIDR Paris"
  type        = string

}

# variable "public_subnet" {
#   description = "CIDR public subnet"
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
# }

variable "subnets" {
  description = "lista de subnets"

}

variable "tags" {
  description = "tags del proyecto"

}

variable "sg_ingress_cdir" {
  description = "CDIR for ingress traffic"
}

variable "ec2_specs" {
  description = "Parametros de la instancia"
}

variable "enable_monitoreo" {
  description = "Habilita el despliege de un servidor de monitoreo"
}
variable "ingress_port_list" {
  description = "lista de puertos de ingress"
}