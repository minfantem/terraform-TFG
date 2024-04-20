paris_cidr = "10.10.0.0/16"
# public_subnet = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env"         = "dev"
  "owner"       = "Mario"
  "cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_Version" = "1.8.0"
  "project"     = "pantera"
  "region"      = "paris"

}
sg_ingress_cdir = "0.0.0.0/0"

ec2_specs = {
  ami           = "ami-0720246d895625a23"
  instance_type = "t2.micro"
}
enable_monitoreo = false

ingress_port_list = [22, 80, 443]
