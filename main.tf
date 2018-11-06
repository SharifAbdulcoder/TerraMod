module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.12.0"

  name           = "my-cluster"
  instance_count = 2

  ami                    = "ami-0b59bfac6be064b78"
  instance_type          = "t2.micro"
  key_name               = "SSHKEY"
  monitoring             = true
  vpc_security_group_ids = ["sg-0bc39239ec5b00e85"]
  subnet_id              = "subnet-32d8207e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "Terraform"
  description = "Terraform"
  vpc_id      = "vpc-5d0e3d35"

  ingress_cidr_blocks = ["10.10.0.0/16"]
}

module "security-group" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "2.9.0"
  name        = "Terraform"
  description = "Security group for Terraform"
  vpc_id      = ""

  ingress_cidr_blocks = ["10.10.0.0/16"]

  # insert the 2 required variables here
}
