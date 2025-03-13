module "vpc" {
    source = "./modules/vpc"
    my_vpc = var.my_vpc
    public-sub-1 = var.public-sub-1
    public-sub-2 = var.public-sub-2
    private-sub-1 = var.private-sub-1
    private-sub-2 = var.private-sub-2
    availability-zone = var.availability-zone
    availability-zone1 = var.availability-zone1
    cidr_all = var.cidr_all
}