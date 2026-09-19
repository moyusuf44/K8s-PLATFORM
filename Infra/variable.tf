variable "cluster_name" {
  type = string
}
variable "addon_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subdomain" {
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

variable "zone_name" {
  type = string
}

variable "region_id" {
  type = string
}

variable "cloudflare_api_token" {
  type = string
}