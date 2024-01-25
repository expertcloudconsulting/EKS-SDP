# Create controlplane master node
resource "aws_instance" "k8cluster-cplane-server" {
  ami                         = var.ec2_ami_workernode
  instance_type               = var.k8_master_instance_type
  count                       = var.k8_master_count
  subnet_id                   = "subnet-0d76e1c19021babdc" #public subnet id for master
  associate_public_ip_address = true
  key_name                    = "aws-master-dev"
  user_data                   = file("custom.sh")
  vpc_security_group_ids      = [aws_security_group.k8-master-sg.id]
  root_block_device {
    volume_size = "15"
  }
  tags = {
    "Name"        = "Dev-K8-ControlPlane-Server"
    "Environment" = "Dev-Freedom"
  }
}

# Create worker nodes
resource "aws_instance" "k8cluster-worker-set-1" {
  for_each                    = toset(var.private_subnets)
  ami                         = var.ec2_ami_workernode
  instance_type               = var.workernode_instance_type
  subnet_id                   = each.value
  associate_public_ip_address = false
  key_name                    = "aws-master-dev"
  user_data                   = file("custom.sh")
  vpc_security_group_ids      = [aws_security_group.k8-workernode-sg.id]
  root_block_device {
    volume_size = "30"
  }
  tags = {
    "Name"        = "Dev-K8-Worker-Node"
    "Environment" = "Dev-Freedom"
  }
}

# Create worker nodes
resource "aws_instance" "k8cluster-worker-set-2" {
  for_each                    = toset(var.private_subnets)
  ami                         = var.ec2_ami_workernode
  instance_type               = var.workernode_instance_type
  subnet_id                   = each.value
  associate_public_ip_address = false
  key_name                    = "aws-master-dev"
  user_data                   = file("custom.sh")
  vpc_security_group_ids      = [aws_security_group.k8-workernode-sg.id]
  root_block_device {
    volume_size = "30"
  }
  tags = {
    "Name"        = "Dev-K8-Worker-Node"
    "Environment" = "Dev-Freedom"
  }
}
