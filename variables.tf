variable "aws_region" {
  description = "La región de AWS a utilizar"
}

variable "shared_credentials_files" {
  description = "La ubicación del archivo de credenciales compartidas de AWS"
  default     = "~/.aws/credentials"
}

variable "profile" {
  description = "El perfil a utilizar"
  default     = "default"
}

variable "tag_name" {
  description = "El nombre para etiquetar los recursos de AWS"
}

variable "cidr_block" {
  description = "El rango de bloque CIDR a utilizar para la VPC de OpenVPN"
  default     = "10.0.0.0/16"
}

variable "ami" {
  description = "La AMI a utilizar"
  default     = "ami-0720246d895625a23"
}

variable "instance_type" {
  description = "El tipo de instancia a utilizar"
}

variable "instance_root_block_device_volume_size" {
  description = "El tamaño del volumen del dispositivo de bloque raíz de la instancia EC2 en GiB"
  default     = 8
}

variable "ec2_username" {
  description = "El usuario para conectarse a la instancia EC2"
  default     = "ec2-user"
}

variable "ssh_public_key_file" {
  # Generado vía 'ssh-keygen -f openvpn -t rsa'
  description = "La clave pública SSH para almacenar en la instancia EC2"
  default     = "settings/openvpn.pub"
}

variable "ssh_private_key_file" {
  # Generado vía 'ssh-keygen -f openvpn -t rsa'
  description = "La clave privada SSH utilizada para conectar a la instancia EC2"
  default     = "settings/openvpn"
}

variable "ovpn_users" {
  type        = list(string)
  description = "La lista de usuarios para provisionar automáticamente con acceso a OpenVPN"
}

variable "ovpn_config_directory" {
  description = "El nombre del directorio para eventualmente descargar los archivos de configuración OVPN"
  default     = "generated/ovpn-config"
}

variable "openvpn_install_script_location" {
  description = "La ubicación del script de instalación de OpenVPN"
  default     = "https://raw.githubusercontent.com/minfantem/terraform-TFG/main/scripts/openvpn-install.sh"
}
