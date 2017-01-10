output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "subnet_private_1" {
  value = "${aws_subnet.private_1.id}"
}

output "subnet_private_2" {
  value = "${aws_subnet.private_2.id}"
}

//output "subnet_private_3" {
//  value = "${aws_subnet.private_3.id}"
//}

output "subnet_dmz_1" {
  value = "${aws_subnet.dmz_1.id}"
}

output "subnet_dmz_2" {
  value = "${aws_subnet.dmz_2.id}"
}

//output "subnet_dmz_3" {
//  value = "${aws_subnet.dmz_3.id}"
//}

output "allow_from_bastion_sg" {
  value = "${aws_security_group.allow_access_from_bastion.id}"
}

output "bastion_sg" {
  value = "${aws_security_group.bastion.id}"
}
