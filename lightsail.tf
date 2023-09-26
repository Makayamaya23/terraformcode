resource "aws_lightsail_instance" "example" {
  name              = "example-instance"
  availability_zone = "us-east-1a" # Change to your desired availability zone
  blueprint_id      = "amazon-linux-2-lts" # Change to your desired OS
  bundle_id         = "nano_2_0" # Change to your desired instance type

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform</h1>" >> /var/www/html/index.html
              EOF
}              