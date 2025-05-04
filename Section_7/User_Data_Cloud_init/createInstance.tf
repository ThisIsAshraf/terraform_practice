resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "WebServer" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.levelup_key.key_name



  tags = {
    Name = "Custom Image"
  }

  # Cloud Init Data

  user_data = data.template_cloudinit_config.install_apache_config.rendered

}

# #  EBS Resources 

# resource "aws_ebs_volume" "ebs_volume_1" {
#     availability_zone = "ap-southeast-1a"
#     size = 10
#     type = "gp2"

#     tags = {
#       Name = "Secondary Volume Disk"
#     }
# }

# # Attach EBS Volume with EC2

# resource "aws_volume_attachment" "ebs_volume_1_attachment" {
#   device_name = "/dev/xvdh"
#   volume_id = aws_ebs_volume.ebs_volume_1.id
#   instance_id = aws_instance.WebServer.id

# }

# Extract the Public IP of EC2

output "public_ip" {
  value = aws_instance.WebServer.public_ip
}