
terraform {
  backend "s3" {	
    bucket = "xlr8s-artifacts"
    encrypt = "false"
    key = "remote-a-181c592/envs/dev-17ce001/01-infra/eks-app-1-32b2383/03-eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
