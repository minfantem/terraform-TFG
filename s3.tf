resource "aws_s3_bucket" "pantera_bucket" {
  bucket = local.s3-sufix
}