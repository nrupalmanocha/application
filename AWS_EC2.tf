/*terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"

}
resource "aws_instance" "myEC2" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "m5.large"
 #Tags to give a name
}
*/