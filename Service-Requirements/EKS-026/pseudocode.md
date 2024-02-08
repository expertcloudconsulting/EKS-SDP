---
Version: "2012-10-17"
Statement:
  - Effect: Allow
    Action:
      - eks:CreateCluster
      - eks:UpdateClusterConfig
      - eks:DescribeCluster
      - eks:ListClusters
    Resource: "*"

  - Effect: Allow
    Action:
      - eks:CreateNodegroup
      - eks:UpdateNodegroupConfig
      - eks:DescribeNodegroup
      - eks:ListNodegroups
    Resource: "*"

  - Effect: Allow
    Action:
      - eks:DescribeUpdate
      - eks:ListUpdates
      - eks:UpdateClusterVersion
    Resource: "*"

  - Effect: Allow
    Action:
      - eks:CreateFargateProfile
      - eks:UpdateFargateProfile
      - eks:DeleteFargateProfile
      - eks:DescribeFargateProfile
      - eks:ListFargateProfiles
    Resource: "*"

  - Effect: Allow
    Action:
      - eks:CreateAddon
      - eks:UpdateAddon
      - eks:DeleteAddon
      - eks:DescribeAddon
      - eks:ListAddons
    Resource: "*"

  - Effect: Allow
    Action:
      - eks:TagResource
      - eks:UntagResource
    Resource: "*"

  - Effect: Allow
    Action:
      - ec2:DescribeSubnets
      - ec2:DescribeSecurityGroups
      - ec2:DescribeKeyPairs
      - ec2:DescribeInstances
      - ec2:DescribeVpcs
      - ec2:DescribeAvailabilityZones
      - ec2:CreateSecurityGroup
      - ec2:CreateKeyPair
      - ec2:RunInstances
    Resource: "*"
