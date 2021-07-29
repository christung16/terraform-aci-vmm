# AUTHOR(s): Chris Tung <yitung@cisco.com>

variable "aci_user" {
  type = map(any)
  sensitive = true
}

variable "vcenter_user" {
  type = map(any)
  sensitive = true
}

variable "tenant" {
  type = map(any)
}

variable "cdp" {
  type = map(any)
}

variable "lldp" {
  type = map(any)
}

variable "lacp" {
  type = map(any)
}

variable "anps" {
  type = map(any)
}

variable "vrfs" {
  type = map(any)
}

variable "bds" {
  type = map(any)
}

variable "epgs" {
  type = map(any)
}

variable "static_vlan_epgs" {
  type = map(any)
}

variable "filters" {
  type = map(any)
}

variable "contracts" {
  type = map(any)
}

variable "l3outs" {
  type = map(any)
}

variable "ext_epg" {
  type = map(any)
}

variable "vlan_pool" {
  type = map(any)
}

variable "vmm_vmware" {
  type = map(any)
}

variable "phydomain" {
  type = map (any)
}

variable "l3domain" {
  type = map (any)
}

variable "access_port_group_policy" {
  type = map(any)
}

variable "sg" {
  type = map(any)
}

variable "pbr" {
  type = map(any)
}

variable "vpc" {
  type = map(any)
}