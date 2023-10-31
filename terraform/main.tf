terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket         = "shoshone-tfstate"
    key            = "shoshonekey/digger_prod_1"
    region         = "us-east-1"
    kms_key_id     = "arn:aws:kms:us-east-1:520291287938:key/4fc9e509-04c4-4881-89e7-46fb49790093"
    dynamodb_table = "shoshone-state-lock"
  }
}

# terraform {
#   required_version = ">= 1.5.0"
#   backend "s3" {
#     bucket         = "shoshone-state-migrate"
#     key            = "migrate/migrate_1"
#     region         = "us-east-1"
#     kms_key_id     = "arn:aws:kms:us-east-1:778339273960:key/a68c3076-a71c-416e-ad2b-892f78950748"
#     dynamodb_table = "shoshone-lock"
#   }
# }
