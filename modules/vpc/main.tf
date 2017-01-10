resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "default-${var.environment}"
    Environment = "${var.environment}"
  }
}

# Private Subnets

resource "aws_subnet" "private_1" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_1}"
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = false

  tags {
    Name = "private-${var.environment}-1"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_2}"
  availability_zone = "${var.aws_region}b"
  map_public_ip_on_launch = false

  tags {
    Name = "private-${var.environment}-2"
    Environment = "${var.environment}"
  }
}

//resource "aws_subnet" "private_3" {
//  vpc_id = "${aws_vpc.default.id}"
//  cidr_block = "${var.private_subnet_3}"
//  availability_zone = "${var.aws_region}c"
//  map_public_ip_on_launch = false
//
//  tags {
//    Name = "private-${var.environment}-3"
//    Environment = "${var.environment}"
//  }
//}

# Routing for private subnets

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.main.id}"
  }
}

resource "aws_route_table_association" "private_1" {
  subnet_id = "${aws_subnet.private_1.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_2" {
  subnet_id = "${aws_subnet.private_2.id}"
  route_table_id = "${aws_route_table.private.id}"
}

//resource "aws_route_table_association" "private_3" {
//  subnet_id = "${aws_subnet.private_3.id}"
//  route_table_id = "${aws_route_table.private.id}"
//}

# DMZ Subnets

resource "aws_subnet" "dmz_1" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.dmz_subnet_1}"
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = false

  tags {
    Name = "dmz-${var.environment}-1"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "dmz_2" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.dmz_subnet_2}"
  availability_zone = "${var.aws_region}b"
  map_public_ip_on_launch = false

  tags {
    Name = "dmz-${var.environment}-2"
    Environment = "${var.environment}"
  }
}

//resource "aws_subnet" "dmz_3" {
//  vpc_id = "${aws_vpc.default.id}"
//  cidr_block = "${var.dmz_subnet_3}"
//  availability_zone = "${var.aws_region}c"
//  map_public_ip_on_launch = false
//
//  tags {
//    Name = "dmz-${var.environment}-3"
//    Environment = "${var.environment}"
//  }
//}

# Routing table for DMZ subnets

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_route_table" "dmz" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }
}

resource "aws_route_table_association" "dmz_1" {
  subnet_id = "${aws_subnet.dmz_1.id}"
  route_table_id = "${aws_route_table.dmz.id}"
}

resource "aws_route_table_association" "dmz_2" {
  subnet_id = "${aws_subnet.dmz_2.id}"
  route_table_id = "${aws_route_table.dmz.id}"
}

//resource "aws_route_table_association" "dmz_3" {
//  subnet_id = "${aws_subnet.dmz_3.id}"
//  route_table_id = "${aws_route_table.dmz.id}"
//}
