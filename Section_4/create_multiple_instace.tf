# Create a EC2 instance using Terraform
resource "aws_instance" "terraform-machine" {
    count = 2
    ami = "ami-01938df366ac2d954"
    instance_type = "t2.micro"

# Defined the instances name
    tags = {
        Name = "cloud-instance-${count.index}"
    }
}
