resource "aws_launch_template" "monkey-target" {
  name_prefix   = "chaos"
  image_id      = "ami-076431be05aaf8080"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "monkey-target" {
  availability_zones = var.zones
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.monkey-target.id
    version = "$Latest"
  }
}