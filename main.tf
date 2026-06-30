# ---------------------------------
# Web Server
# ---------------------------------
resource "aws_instance" "web_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Web-Server"
  }
}

# ---------------------------------
# App Server
# ---------------------------------
resource "aws_instance" "app_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  associate_public_ip_address = false
  
  tags = {
    Name = "App-Server"
  }
}

# ---------------------------------
# Database Server
# ---------------------------------
resource "aws_instance" "db_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "DB-Server"
  }
}