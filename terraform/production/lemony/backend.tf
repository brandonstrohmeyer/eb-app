terraform {
  required_version = ">= 0.12.0"

# Set Terraform to use an S3 backend to store state files.
  backend "s3" {
    bucket         = "stro"
    region         = "us-east-1"
    key            = "lemony/terraform/terraform.tfstate"
    # dynamodb is not being used for 
    # state file locking due to cost
    # dynamodb_table = "terraform-state-lock-dynamo"
  }
}
