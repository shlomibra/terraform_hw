// set the provider to AWS and the AWS region to us-west-1
provider "aws" {
  region = "us-west-1"
  shared_credentials_file = "./credentials"
  profile = "terraformusr"
}