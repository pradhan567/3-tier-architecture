resource "aws_vpc" "my_vpc" {
  cidr_block = var.my_vpc
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      "Name" = "my-igw" 
    }
}

#######################Creating Subnets###############################
resource "aws_subnet" "public-sub-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public-sub-1
  availability_zone = var.availability-zone
  tags = {
    Name = "public-sub-1"
  }
}

resource "aws_subnet" "public-sub-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public-sub-2
  availability_zone = var.availability-zone1
  tags = {
    Name = "public-sub-2"
  }
}

resource "aws_subnet" "private-sub-1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private-sub-1
  availability_zone = var.availability-zone
  tags = {
    Name = "private-sub-1"
  }
}

resource "aws_subnet" "private-sub-2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private-sub-2
  availability_zone = var.availability-zone1
  tags = {
    Name = "private-sub-2"
  }
}

####################Create NAT and EIP############################
resource "aws_eip" "my-eip" {
    domain = "vpc"
    tags = {
      Name = "my-eip"
    }
}

resource "aws_nat_gateway" "my-nat" {
  allocation_id = aws_eip.my-eip.id
  subnet_id     = aws_subnet.public-sub-1.id

  tags = {
    Name = "my-NAT"
  }
  depends_on = [aws_internet_gateway.my-igw]
}
####################Create Routetables############################
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.cidr_all
    gateway_id = aws_internet_gateway.my-igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-sub-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public-sub-2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.cidr_all
    gateway_id = aws_nat_gateway.my-nat.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-sub-1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private-sub-2.id
  route_table_id = aws_route_table.private-rt.id
}