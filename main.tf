module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.12.0"

  name           = "my-cluster"
  instance_count = 2

  ami                    = "ami-0b59bfac6be064b78"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-0bc39239ec5b00e85"]
  subnet_id              = "subnet-32d8207e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
