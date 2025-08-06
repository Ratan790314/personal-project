provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "devops-project-cluster"
  cluster_version = "1.25"
  subnets         = ["subnet-abc123", "subnet-def456"]  # Replace with your actual subnets
  vpc_id          = "vpc-xxxxxxxx"                      # Replace with your actual VPC ID

  node_groups = {
    dev_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }
}

