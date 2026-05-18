resource "aws_s3_bucket" "remote_s3" {
  bucket = "tws-jnoon-terraform-state"

  tags = {
    Name = "TWS-Jnoon-terraform-state"
  }
}