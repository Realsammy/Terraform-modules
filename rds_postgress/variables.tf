variable "password" {
    description = "password to te database"
    
  
}

variable "username" {
    description = "database user name"
  
}

variable "cidr_block" {
  description = "The cidr block for the network"
  
}

variable "dns_enable" {
  description = "Enabling dns support"
  type = bool
    
}

variable "dns_host" {
  description = "Enabling dns hostname"
  type = bool
}

variable "identifier" {
  description = "name of the rds instance"
  type = string
}

variable "allocated_storage" {
  description = "storage allocated to the db instance"
  type = number
}

variable "storage_type" {
  description = "the storage type"
  
}

variable "db_engine" {
  description = "The dataase engine"
  
}

variable "db_instance_class" {
  description = "The db instance class"
  
}

variable "db_engine_version" {
  description = "The database engine version"
  
}

variable "skip_final_snapshot" {
  description = "To skip the final snapshot before destroying the rds instance"
  type = bool
  
}
