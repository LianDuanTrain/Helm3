# main.tf
# //////////////////////////////
#          Providers
# //////////////////////////////
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.13.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Name = "create-by-terraform-EKS-Demo-need-tag"
    }
  }
}

# Exec plugins
provider "helm" {
  kubernetes {    
    host                   = aws_eks_cluster.eks-demo-cluster-01.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.eks-demo-cluster-01.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", "eks-demo-cluster-01"]
      command     = "aws"
    }
  }
}
# Using a kubeconfig file
#provider "helm" {
#  kubernetes {        
#    config_path = "~/.kube/config"
#  }
#}

# //////////////////////////////
#          Resources
# //////////////////////////////

# VPC-01
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "eks-demo-vpc-01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "eks-demo-vpc-01"
  }
}
# VPC-02
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet
resource "aws_subnet" "eks-demo-public-01" {
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  vpc_id                  = aws_vpc.eks-demo-vpc-01.id
  map_public_ip_on_launch = true
  tags = {
    Name = "eks-demo-public-01"
  }
}



# VPC-03
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet
resource "aws_subnet" "eks-demo-public-02" {
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  vpc_id                  = aws_vpc.eks-demo-vpc-01.id
  map_public_ip_on_launch = true
  tags = {
    Name = "eks-demo-public-02"
  }
}

# VPC-05
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "eks-demo-internet-gateway-01" {
  vpc_id = aws_vpc.eks-demo-vpc-01.id
  tags = {
    Name = "eks-demo-internet-gateway-01"
  }
}


# VPC-04
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route

resource "aws_route" "eks-internet_access" {
  route_table_id         = aws_vpc.eks-demo-vpc-01.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eks-demo-internet-gateway-01.id

}

# eks-cluster-01
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster
resource "aws_eks_cluster" "eks-demo-cluster-01" {
  name     = "eks-demo-cluster-01"
  version  = "1.28"
  role_arn = aws_iam_role.eks-demo-cluster-admin-role-01.arn

  vpc_config {
    subnet_ids              = [aws_subnet.eks-demo-public-01.id,aws_subnet.eks-demo-public-02.id]
    endpoint_public_access  = true
    endpoint_private_access = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-demo-cluster-01-AmazonEKSClusterPolicy,aws_iam_role_policy_attachment.eks-demo-cluster-01-AmazonEKSVPCResourceController
  ]
  tags = {
    demo = "eks"
  }
}

# eks-cluster-02
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "eks-demo-cluster-admin-role-policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# eks-cluster-03
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "eks-demo-cluster-admin-role-01" {
  name               = "eks-demo-cluster-admin-role-01"
  assume_role_policy = data.aws_iam_policy_document.eks-demo-cluster-admin-role-policy.json
}

# eks-cluster-04
resource "aws_iam_role_policy_attachment" "eks-demo-cluster-01-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-demo-cluster-admin-role-01.name
}

# eks-cluster-05
# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "eks-demo-cluster-01-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-demo-cluster-admin-role-01.name
}

# eks-cluster-06
# Addones
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon

resource "aws_eks_addon" "eks-demo-addon-coredns" {
  cluster_name                = aws_eks_cluster.eks-demo-cluster-01.name
  addon_name                  = "coredns"
  addon_version               = "v1.10.1-eksbuild.2" 
  resolve_conflicts_on_create = "OVERWRITE" 
}

# eks-cluster-07
resource "aws_eks_addon" "eks-demo-addon-kube-proxy" {
  cluster_name                = aws_eks_cluster.eks-demo-cluster-01.name
  addon_name                  = "kube-proxy"
  addon_version               = "v1.28.1-eksbuild.1" 
  resolve_conflicts_on_create = "OVERWRITE" 
}

# eks-cluster-08
resource "aws_eks_addon" "eks-demo-addon-vpc-cni" {
  cluster_name                = aws_eks_cluster.eks-demo-cluster-01.name
  addon_name                  = "vpc-cni"
  addon_version               = "v1.14.1-eksbuild.1" 
  resolve_conflicts_on_create = "OVERWRITE" 
}


output "endpoint" {
  value = aws_eks_cluster.eks-demo-cluster-01.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks-demo-cluster-01.certificate_authority[0].data
}



# eks-cluster-09
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

resource "aws_eks_node_group" "eks-demo-ec2-node-group-01" {
  cluster_name    = aws_eks_cluster.eks-demo-cluster-01.name
  node_group_name = "eks-demo-node-group-01"
  node_role_arn   = aws_iam_role.eks-demo-ec2-node-group-role-01.arn
  subnet_ids      = [aws_subnet.eks-demo-public-01.id,aws_subnet.eks-demo-public-02.id]
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-demo-node-group-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-demo-node-group-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-demo-node-group-AmazonEC2ContainerRegistryReadOnly,
  ]
  labels = {
    demo = "eks", 
    eksNodeGroup = "t3_medium"
  }
}

# eks-cluster-10
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "eks-demo-ec2-node-group-role-01" {
  name = "eks-demo-ec2-node-group-role-01"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

# eks-cluster-11
resource "aws_iam_role_policy_attachment" "eks-demo-node-group-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-demo-ec2-node-group-role-01.name
}

# eks-cluster-12
resource "aws_iam_role_policy_attachment" "eks-demo-node-group-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-demo-ec2-node-group-role-01.name
}

# eks-cluster-13
resource "aws_iam_role_policy_attachment" "eks-demo-node-group-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-demo-ec2-node-group-role-01.name
}

# Run the update-kubeconfig command after the EKS cluster is created
resource "null_resource" "update_kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region us-east-1 --name ${aws_eks_cluster.eks-demo-cluster-01.name}"
  }
  depends_on = [aws_eks_cluster.eks-demo-cluster-01]
}

resource "helm_release" "demo-nginx" {
  name       = "demo-nginx"
  repository = "https://lianduantrain.github.io/HelmTerraformEKS/stable"
  chart      = "demo-nginx-chart"
  version    = "0.2.0"
  depends_on = [aws_eks_node_group.eks-demo-ec2-node-group-01]
}

resource "null_resource" "get-demo-nginx-url" {
  provisioner "local-exec" {
    command = "kubectl get svc demo-nginx"
  }
  depends_on = [helm_release.demo-nginx]
}




