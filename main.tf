resource "aws_instance" "TF_instance" {
  ami           = "ami-04e601abe3e1a910f"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_instance"
  }
}
