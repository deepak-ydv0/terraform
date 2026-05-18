module "dev-infra" {
  source         = "./infra"
  env            = "dev"
  bucket_name    = "my-dev-s3-bucket-123"
  instance_count = 2
  instance_type  = "t3.micro"
  ec2_ami_id     = "ami-07a00cf47dbbc844c"
  hash_key       = "studentID"
}

module "staging-infra" {
  source         = "./infra"
  env            = "staging"
  bucket_name    = "my-staging-s3-bucket-456"
  instance_count = 1
  instance_type  = "t3.micro"
  ec2_ami_id     = "ami-07a00cf47dbbc844c"
  hash_key       = "studentID"
}

module "prod-infra" {
  source         = "./infra"
  env            = "prod"
  bucket_name    = "my-prod-s3-bucket-789"
  instance_count = 2
  instance_type  = "t3.micro"
  ec2_ami_id     = "ami-07a00cf47dbbc844c"
  hash_key       = "studentID"
}
