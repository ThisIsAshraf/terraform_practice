# Auto Scalling Lanuch Configuration

resource "aws_launch_configuration" "levelup-launchconfig" {
  name_prefix = "levelup-launchconfig"
  image_id = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.levelup_key.key_name
  security_groups = [ aws_security_group.levelup-instances.id ]
  user_data       = "#!/bin/bash\napt-get update\napt-get -y install net-tools nginx\nMYIP=`ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'Hello Team\nThis is my IP: '$MYIP > /var/www/html/index.html"

  lifecycle {
    create_before_destroy = true
  }

}

# Generate Key
resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

# Auto Scalling Group

resource "aws_autoscaling_group" "levelup-autoscalling" {
  name = "levelup-autoscalling"
  vpc_zone_identifier = [ aws_subnet.level_up_vpc_public_1.id, aws_subnet.level_up_vpc_public_1.id ]
  launch_configuration = aws_launch_configuration.levelup-launchconfig.name
  min_size = 2
  max_size = 2
  health_check_grace_period = 200
  health_check_type = "ELB"
  load_balancers = [ aws_elb.levelup-elb.name ]
  force_delete = true

  tag {
    key = "Name"
    value = "Levelup Custom EC2 Instance via Load Balancer"
    propagate_at_launch = true
  }
}

output "ELB" {
  value = aws_elb.levelup-elb.dns_name
}