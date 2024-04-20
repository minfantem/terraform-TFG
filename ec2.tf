variable "instancias" {
  description = "Nombre de las instancias"
  default     = ["apache"]
  type        = list(string)
}


resource "aws_instance" "public_instance" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.bash")

  tags = {
    Name = "${each.value}-${local.sufix}"
  }

}

resource "aws_instance" "monitoreo_instance" {
  count                  = var.enable_monitoreo ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.bash")

  tags = {
    Name = "Monitoreo-${local.sufix}"
  }

}

