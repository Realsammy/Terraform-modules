#module "cluster_resourece" {
#    source = "./ekscluster"

 #   cluster-name   = "myNewCluster"
  #  region         = "us-east-1" 
  #  instance-types = [ "t2.micro" ] 
  #  desired_size   = 1
  #  max_size       = 2
  #  min_size       = 1
   # max_unaval     = 1
   # cidr_block     = "10.0.0.0/16"
   # dns_enable     = true
   # dns_host       = true

#}

module "dev_vm" {
    source = "./ubuntu_vm"
    instance_type = "t2.medium"
    ami = "ami-0ae9328bcad70db94"
    
   # region = "us-east-1"
   # encrypted = true
   # bucket_name = "truthbucket9846575"
    #acl         = "public-read-write"
   # tag_name = "samplebucket"


}

module "postgres_db" {
    source = "./rds_postgress"
    password = "my_password"
    username = "admin123"
    dns_enable = true
    cidr_block = "10.0.0.0/16"
    dns_host = true
    identifier = "my-rds-instance"
    allocated_storage = 20
    storage_type = "gp2"
    db_engine = "postgres"
    db_instance_class = "db.t3.micro"
    db_engine_version = "16.1"
    skip_final_snapshot = true
}