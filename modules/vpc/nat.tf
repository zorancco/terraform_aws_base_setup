resource "aws_security_group" "nat" {
  name = "nat"
  description = "Allow internet connectivity from the private subnet via NAT"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${aws_subnet.private_1.cidr_block}",
                   "${aws_subnet.private_2.cidr_block}",
//                   "${aws_subnet.private_3.cidr_block}"
                  ]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_subnet.private_1.cidr_block}",
                   "${aws_subnet.private_2.cidr_block}",
//                   "${aws_subnet.private_3.cidr_block}"
                  ]
  }
}

//resource "aws_instance" "nat" {
//  ami = "${lookup(var.nat_ami, var.aws_region)}"
//  instance_type = "t2.micro"
//  security_groups = ["${aws_security_group.nat.id}"]
//  subnet_id = "${aws_subnet.dmz_1.id}"
//  source_dest_check = false
//
//  tags {
//    Name = "nat-${var.environment}"
//    Environment = "${var.environment}"
//  }
//}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "main" {
  subnet_id = "${aws_subnet.dmz_1.id}"
  allocation_id = "${aws_eip.nat.id}"
  depends_on = ["aws_internet_gateway.main", "aws_eip.nat"]
}
