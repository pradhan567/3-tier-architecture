## Create a VPC #####
1. VPC create
2. 4 subnets (2 pub & 2 private)
3. IGW
4. NAT
5. Route table for public subnets
6. Route table for private subnets
7. Associate pub rt with pub subnets
8. Associate priv rt with priv subnets
9. Associate IGW with pub rt
10. Associate NAT with priv rt

## Create 2 Ec2 instance #########
1. 1st ec2 (public) which will be called as Bastian host
    - ubunntu ami
    - t2.micro
    - create a key and upload to aws parameter store
    - vpc public and Az us-east-1a
    - public ip enabled
    - security group where port 22 is allowed from 53 range 53.217.91.0/24
2. 2nd ec2 (private) which will be called as application server
    - ubuntu ami
    - t2.large
    - vpc private az 1a
    - public ip disabled
    - security group allowed for 22 port from sg bastian ec2 host

3. Create a ALB
    - Create target group
    - Create listener
    - Create a security group for ALB
