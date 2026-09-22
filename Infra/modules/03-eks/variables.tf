variable "cluster_name" {
    type = string 
}

variable "subnet_ids" {
  type = list(string)
}

variable "addon_name" {
  type = string
}

variable "desired_size" {
  type = string
}

variable "max_size" {
  type = string 
}

variable "min_size" {
  type = string 
}
