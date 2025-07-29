resource "aws_instance" "app" {
  ami                    = "ami-068d5d5ed1eeea07c" # RedHat 10
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.app_sg_id]
  key_name               = var.key_name
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name = "mean-app"
  }
}
