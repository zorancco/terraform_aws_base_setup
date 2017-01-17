provider "aws" {
  region = "${var.aws_region}"
}

# Resources

resource "aws_route53_zone" "public" {
  name = "albelli.com"
}
