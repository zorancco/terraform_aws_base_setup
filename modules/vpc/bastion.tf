resource "aws_security_group" "bastion" {
  name = "bastion"
  description = "Allow SSH traffic from the internet"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_access_from_bastion" {
  name = "allow-access-from-bastion"
  description = "Grants access to SSH from bastion server"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = ["${aws_security_group.bastion.id}"]
  }
}
//
//resource "aws_instance" "bastion" {
//  ami = "${var.bastion_ami}"
//  instance_type = "t2.micro"
//  subnet_id = "${aws_subnet.dmz_1.id}"
//  security_groups = ["${aws_security_group.bastion.id}"]
//
//  tags {
//    Name = "bastion-${var.environment}"
//    Environment = "${var.environment}"
//  }
//}
//
//resource "aws_eip" "bastion" {
//  instance = "${aws_instance.bastion.id}"
//  vpc = true
//}
