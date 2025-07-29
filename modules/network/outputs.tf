output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public.id, aws_subnet.public_b.id]
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_azs" {
  value = [
    aws_subnet.public.availability_zone,
    aws_subnet.public_b.availability_zone
  ]
}
