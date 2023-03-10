module "ebs_csi_driver_role" {
  source                        = "./modules/terraform-aws-iam-4.13.2/modules/iam-assumable-role-with-oidc"
  create_role                   = true
  role_name                     = "${var.cluster_name}-ebs-csi-driver-role"
  provider_url                  = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  role_policy_arns              = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa", "system:serviceaccount:kube-system:ebs-csi-node-sa"]
}

resource "kubernetes_service_account" "ebs-csi-controller-sa" {
  metadata {
    name      = "ebs-csi-controller-sa"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = module.ebs_csi_driver_role.iam_role_arn
    }
  }
}

resource "kubernetes_service_account" "ebs-csi-node-sa" {
  metadata {
    name      = "ebs-csi-node-sa"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = module.ebs_csi_driver_role.iam_role_arn
    }
  }
}