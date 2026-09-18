resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = "k8s-app-node-group"
  node_role_arn   = aws_iam_role.this
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [  ]
}



resource "aws_eks_cluster" "this" {
    name = var.cluster_name

    access_config {
      authentication_mode = "API"
    }

    role_arn = aws_iam_role.this.arn 
    version = "1.35"

    vpc_config {
      subnet_ids = var.subnet_ids
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
     ]
}

resource "aws_iam_role" "this" {
    name                = "eks-cluster-iam-role"
    assume_role_policy  = jsonencode({
        Version   = "2012-10-17"
        Statement = [
                {
                    Action = [
                        "sts:AssumeRole",
                        "sts:TagSession"
                    ]
                    Effect = "Allow"
                    Principal = {
                        Service = "eks.amazonaws.com"
                    }
                },
        ]
    })
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.this.name 
}

