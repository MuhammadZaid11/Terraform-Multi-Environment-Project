# Workspace-Driven Infrastructure

# Usage:
#   terraform workspace new dev   && terraform apply
#   terraform workspace new stage   && terraform apply
#   terraform workspace new prod  && terraform apply


locals {
  env_config = {
    dev = {
      instance_count = 2
      table_count = 1
      bucket_count = 1
    }

    stage = {
      instance_count = 2
      table_count = 1
      bucket_count = 1
    }

    prod = {
      instance_count = 3
      table_count = 2
      bucket_count = 2
    }

  }

  current = lookup(local.env_config, terraform.workspace, local.env_config["dev"])
  
  common_tags = {
    Environment = terraform.workspace
    ManageBy = "terraform"
    Project = "workspace-practice"
  }
}

# --- EC2 Module ---
module "ec2" {
    source = "./modules/EC2"

    env = terraform.workspace
    instance_count = local.current.instance_count
    ami = var.ami
    instance_type = var.instance_type
    common_tags = local.common_tags
    public_key_path =var.key_public_path
    key_name = "${terraform.workspace}-key"
}



# --- S3 Module ---


module "s3" {
    source = "./modules/S3"

    env = terraform.workspace
    bucket_count = local.current.bucket_count
    common_tags = local.common_tags
  
}



# --- DynamoDB Module ---
module "dynamodb" {
    source = "./modules/DynomoDB"

    env = terraform.workspace
    table_count = local.current.table_count
    common_tags = local.common_tags
  
}