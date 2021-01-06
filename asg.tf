module "asg" {
  source        = "git::https://DevOps-Batches@dev.azure.com/DevOps-Batches/DevOps52/_git/terraform-asg"
  component     = "user"
  SUBNETS       = data.terraform_remote_state.vpc.outputs.APP_SUBNETS
  DESIRED       = 1
  MIN           = 1
  MAX           = 1
  VPC_CIDR      = data.terraform_remote_state.vpc.outputs.VPC_CIDR
  MGMT_CIDR     = data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR
  APP_PORT      = 8080
  ENV           = var.ENV
  VPC_ID        = data.terraform_remote_state.vpc.outputs.VPC_ID
  HEALTH        = "/health"
}
