resource "aws_instance" "mongo" {
  ami                    = "ami-068d5d5ed1eeea07c" # RedHat 10 (ajusta si usas otro)
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.app_sg_id]
  key_name               = var.key_name

  # MongoDB no debe tener IP pública, se conecta solo desde la app en la VPC
  associate_public_ip_address = false

  # Script de inicialización para instalar y arrancar MongoDB
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "mean-mongo"
  }
}
