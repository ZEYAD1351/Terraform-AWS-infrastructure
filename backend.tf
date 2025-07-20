terraform {
  backend "s3" {
    bucket = "zeyad-135"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}