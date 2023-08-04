resource "aws_instance" "tf_instance" {
  ami           = "ami-04e601abe3e1a910f"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform_instance"
  }
}
