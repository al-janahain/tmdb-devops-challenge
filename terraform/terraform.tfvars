region           = "us-east-1"
vpc_cidr         = "10.0.0.0/16"
subnet_cidr      = "10.0.1.0/24"
availability_zone = "us-east-1b"
key_name         = "hassan" # Replace with your key name
public_key_path  = "../public_key.pem" # Replace with the path to your public key
vpc_name         = "my-vpc"
subnet_name      = "my-subnet"
s3_bucket        = "my-terraform-state-bucket" # Replace with your S3 bucket name
private_key_path = "../public_key" # Replace with the path to your private key
