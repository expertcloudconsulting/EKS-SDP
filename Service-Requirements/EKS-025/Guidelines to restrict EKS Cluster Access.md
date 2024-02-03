This document provides guidelines for Securing EKS Access at VPC/Network level.

For any updates ensure the necessary IAM role is provisioned with required level of access/policies.

1. Ensure the IAM role associated with the EKS cluster has the necessary permissions to modify the cluster's VPC configuration.
Policies such as AmazonEKSVPCResourceController and AmazonEKSServicePolicy may be required.

2. Retrieve information about the VPC associated with the EKS cluster (VPC ID, Subnet IDs, etc.).
   
3. Identify the security group associated with the EKS cluster control plane.
Update the inbound rules of the security group to allow traffic only from the desired CIDR range.

aws ec2 authorize-security-group-ingress \\
  --region <region> \\
  --group-id <security-group-id> \\
  --protocol tcp \\
  --port 443 \\
  --cidr <desired-cidr-range>

4. Identify the route table associated with the EKS cluster's subnets.
Update the route table to route traffic to the EKS cluster API server only from the desired CIDR range.

aws ec2 create-route \\
  --region <region> \\
  --route-table-id <route-table-id> \\
  --destination-cidr-block <eks-cluster-api-endpoint-cidr> \\
  --gateway-id <eks-cluster-vpc-endpoint-id>

5. Test and validate - Set up CloudWatch logs for VPC Flow Logs to monitor and review network traffic.
