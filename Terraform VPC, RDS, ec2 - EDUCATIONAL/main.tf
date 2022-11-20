provider "aws" {
  region = "var.aws_region"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"

  # This is not a good idea to use access and sectet keys here. It's better to set them through environment variables.
  # for Linux:
  # $ export AWS_ACCESS_KEY_ID="my-access-key"
  # $ export AWS_SECRET_ACCESS_KEY="my-secret-key"
  # for Windows:
  # set AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
  # set AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
}
