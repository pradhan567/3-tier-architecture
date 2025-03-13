module "security-groups" {
  source = "./modules/security-groups"
  name = var.bastian-sg-name
  vpc_id = module.vpc.vpc_id
  cidr_all = var.cidr_all
  cidr_ipv4 = var.cidr_ipv4
}