# Define the provider (e.g., AWS, GCP, Azure)
provider "aws" {
  region = "us-west-2"
}

# Create a new EC2 key pair
resource "aws_key_pair" "my_keypair" {
  key_name   = "my-keypair"
  public_key = file("~/.ssh/my-keypair.pem")
}

# Create a new EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0b20a6f09484773af"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_keypair.key_name

  tags = {
    Name = "MyInstance"
  }
}

# Create an Elastic IP
resource "aws_eip" "my_eip" {
  instance = aws_instance.my_instance.id
  vpc      = true
}

# Associate the Elastic IP with the EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_keypair.key_name

  tags = {
    Name = "MyInstance"
  }
}

resource "aws_eip_association" "my_eip_assoc" {
  instance_id   = aws_instance.my_instance.id
  allocation_id = aws_eip.my_eip.id
}


# Install MySQL on the instance
resource "remote-exec" "install_mysql" {
  connection {
    type        = "ssh"
    host        = aws_instance.my_instance.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/my-keypair.pem")
  }

  inline = [
    "sudo yum update -y",
    "sudo yum install -y mysql-server",
    "sudo systemctl start mysqld",
    "sudo systemctl enable mysqld"
  ]
}

# Output the public IP address of the instance
output "public_ip" {
  value = aws_instance.my_instance.public_ip
}
