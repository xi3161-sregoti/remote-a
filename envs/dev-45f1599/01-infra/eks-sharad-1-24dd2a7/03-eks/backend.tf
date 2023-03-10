
terraform {
  backend "s3" {	
    bucket = "xlr8s-artifacts"
    encrypt = "false"
    key = "test-project-4e38afb/envs/dev-45f1599/01-infra/eks-sharad-1-24dd2a7/03-eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
