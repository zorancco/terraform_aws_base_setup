#resource "aws_route53_record" "bastion" {
#  zone_id = "${var.public_dns_zone}"
#  name = "bastion.${var.environment}.domain.com"
#  type = "A"
#  ttl = "300"
#  records = ["${aws_eip.bastion.public_ip}"]
#}

//resource "aws_route53_record" "nat" {
//  zone_id = "${var.public_dns_zone}"
//  name = "nat.${var.environment}.albelli.com"
//  type = "CNAME"
//  ttl = "300"
//  records = ["${aws_eip.nat.public_ip}"]
//}
