variable "ssh_key_name" {
  description = "Key name of the Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "ssh_pub_key" {
  description = "Public Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "zone" {
  description = "The name of the zone to deploy the mybb into."
  type        = string
  default     = "ch-gva-2"
}

variable "name" {
  description = "The name of the mybb instance."
  type        = string
  default     = "mybb"
}

variable "instance_type" {
  description = "The instance type to use for the instance."
  type        = string
  default     = "standard.micro"
}

variable "labels" {
  description = "A map of key/value labels."
  type        = map(string)
}

variable "disk" {
  description = "The disk is to set the storage for instance."
  type        = number
  default     = "10"
}

variable "temp_name" {
  description = "The name is to set the template."
  type        = string
  default     = "Linux Ubuntu 20.04 LTS 64-bit"
}

variable "firewall_rules" {
  description = "List out the port number and protocall to allow in Firewall Rules"
  type        = list(any)
  default     = [{ protocol = "tcp", start_port = "22", end_port = "22" }, { protocol = "tcp", start_port = "443", end_port = "443" }, { protocol = "tcp", start_port = "80", end_port = "80" }]
}

variable "exoscale_api_key" {
  description = "API key for Exoscale"
  type        = string
  default     = ""
}

variable "exoscale_api_secret" {
  description = "API secret for Exoscale"
  type        = string
  default     = ""
}

variable "user" {
  description = "Set the instance user name"
  type        = string
  default     = "ubuntu"
}

variable "private_key" {
  description = "Set the private key value for the instance from the hostmachine"
  type        = string
  default     = ""
}