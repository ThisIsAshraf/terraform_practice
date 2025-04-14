
resource "aws_instance" "MyFirstInstance" {
    ami = "ami-01938df366ac2d954"
    instance_type = "t2.micro"

    tags = {
        Name = "WebServer"
    }
}