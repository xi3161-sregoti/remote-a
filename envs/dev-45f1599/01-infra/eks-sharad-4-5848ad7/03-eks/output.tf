

output "cluster_endpoint" {
	description = "Endpoint for EKS control plane."
	value       = module.eks.cluster_endpoint
	sensitive    = false
}

output "cluster_certificate_authority_data" {
	description = "Base64 encoded certificate data required to communicate with the cluster"
	value       = module.eks.cluster_certificate_authority_data
	sensitive    = false
}

output "cluster_security_group_id" {
	description = "Security group ids attached to the cluster control plane."
	value       = module.eks.cluster_security_group_id
	sensitive    = false
}

output "region" {
	description = "AWS region."
	value       = module.eks.region
	sensitive    = false
}

output "node_groups" {
	description = "Outputs from node groups"
	value       = module.eks.node_groups
	sensitive    = false
}

output "cluster_oidc_issuer_url" {
	description = "The URL on the EKS cluster OIDC Issuer"
	value       = module.eks.cluster_oidc_issuer_url
	sensitive    = false
}

