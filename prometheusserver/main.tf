module "prometheus" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "prometheus"

  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a39710fe439d3d9a"]
  subnet_id              = "subnet-01092666767707701"
  ami                    = data.aws_ami.ami_info.id
  user_data              = file("prometheus.sh")
  tags = {
    Name = "prometheus"
  }

  # Define the root volume size and type
  root_block_device = [
    {
      volume_size           = 20   # Size of the root volume in GB
      volume_type           = "gp3" # General Purpose SSD (you can change it if needed)
      delete_on_termination = true  # Automatically delete the volume when the instance is terminated
    }
  ]
}
/* module "node-1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "node-1"

  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a39710fe439d3d9a"]
  subnet_id              = "subnet-01092666767707701"
  ami                    = data.aws_ami.ami_info.id
  user_data              = file("node-1.sh")
  tags = {
    Name = "node-1"
  }

  # Define the root volume size and type
  root_block_device = [
    {
      volume_size           = 20    # Size of the root volume in GB
      volume_type           = "gp3" # General Purpose SSD (you can change it if needed)
      delete_on_termination = true  # Automatically delete the volume when the instance is terminated
    }
  ]
}

module "node-2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "node-2"

  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a39710fe439d3d9a"]
  subnet_id              = "subnet-01092666767707701"
  ami                    = data.aws_ami.ami_info.id
  user_data              = file("node-2.sh")
  tags = {
    Name = "node-1"
  }

  # Define the root volume size and type
  root_block_device = [
    {
      volume_size           = 20    # Size of the root volume in GB
      volume_type           = "gp3" # General Purpose SSD (you can change it if needed)
      delete_on_termination = true  # Automatically delete the volume when the instance is terminated
    }
  ]
}
 */