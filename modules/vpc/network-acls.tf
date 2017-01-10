# Network ACLs

resource "aws_network_acl" "dmz-1" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.dmz_1.id}"]

  ingress = {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  ingress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  ingress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  ingress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }

  egress = {
    protocol = "all"
    rule_no = 100
    action = "allow"
    cidr_block =  "${aws_vpc.default.cidr_block}"
    from_port = 0
    to_port = 0
  }

  egress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  egress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  egress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }
}

resource "aws_network_acl" "dmz-2" {
  vpc_id = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.dmz_2.id}"]

  ingress = {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  ingress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  ingress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }

  ingress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }

  egress = {
    protocol = "all"
    rule_no = 100
    action = "allow"
    cidr_block =  "${aws_vpc.default.cidr_block}"
    from_port = 0
    to_port = 0
  }

  egress = {
    protocol = "tcp"
    rule_no = 101
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 80
    to_port = 80
  }

  egress = {
    protocol = "tcp"
    rule_no = 102
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 443
    to_port = 443
  }

  egress = {
    protocol = "tcp"
    rule_no = 103
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 1024
    to_port = 65535
  }
}
//
//resource "aws_network_acl" "dmz-3" {
//  vpc_id = "${aws_vpc.default.id}"
//  subnet_id = "${aws_subnet.dmz_3.id}"
//
//  ingress = {
//    protocol = "tcp"
//    rule_no = 100
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 80
//    to_port = 80
//  }
//
//  ingress = {
//    protocol = "tcp"
//    rule_no = 101
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 443
//    to_port = 443
//  }
//
//  ingress = {
//    protocol = "tcp"
//    rule_no = 102
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 22
//    to_port = 22
//  }
//
//  ingress = {
//    protocol = "tcp"
//    rule_no = 103
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 1024
//    to_port = 65535
//  }
//
//  egress = {
//    protocol = "all"
//    rule_no = 100
//    action = "allow"
//    cidr_block =  "${aws_vpc.default.cidr_block}"
//    from_port = 0
//    to_port = 65535
//  }
//
//  egress = {
//    protocol = "tcp"
//    rule_no = 101
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 80
//    to_port = 80
//  }
//
//  egress = {
//    protocol = "tcp"
//    rule_no = 102
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 443
//    to_port = 443
//  }
//
//  egress = {
//    protocol = "tcp"
//    rule_no = 103
//    action = "allow"
//    cidr_block =  "0.0.0.0/0"
//    from_port = 1024
//    to_port = 65535
//  }
//}
