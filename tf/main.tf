terraform {
  backend "s3" {
    bucket = "wexort-tf-states"
    key    = "chaos/"
    region = "eu-central-1"
  }
}