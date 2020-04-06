resource "aws_ebs_volume" "secondary-volume" {
    availability_zone = "us-east-1"
    size = "20"
    type = "gp2" #general purpose storage
    tags = {
        Name = "extra volume data"
    }
  }

resource "aws_volume_attachement" "volume-attachment" {
    device_name = "/dev/xvdh"
    volume_id = ""
    instance_id = ""
}