

aci_user = {
    
    username = "admin"
    password = "C1sc0123"
    url = "https://10.74.202.71"
}
vcenter_user = {
    
    username = "administrator@vsphere.local"
    password = "C1sc0123"
    url = "10.74.202.163"
}
cdp = {
    
two_tiers_com_cdp_enable = {
    
    name = "two_tiers_com_cdp_enable"
    admin_st = "enabled"
}
two_tiers_com_cdp_disable = {
    
    name = "two_tiers_com_cdp_disable"
    admin_st = "disabled"
}
}
lldp = {
    
two_tiers_com_lldp_enable = {
    
    name = "two_tiers_com_lldp_enable"
    description = "two_tiers_com_lldp_enable"
    admin_tx_st = "enabled"
    admin_rx_st = "enabled"
}
two_tiers_com_lldp_disable = {
    
    name = "two_tiers_com_lldp_disable"
    description = "two_tiers_com_lldp_disable"
    admin_tx_st = "disabled"
    admin_rx_st = "disabled"
}
}
lacp = {
    
two_tiers_com_lacp_active = {
    
    name = "two_tiers_com_lacp_active"
    ctrl = ["fast-sel-hot-stdby", "graceful-conv", "susp-individual"]
    mode = "active"
}
}
vlan_pool = {
    
two_tiers_com_vlan_pool_1 = {
    
    name = "two_tiers_com_vlan_pool_1"
    alloc_mode = "dynamic"
    from = "vlan-2001"
    to = "vlan-2100"
}
two_tiers_com_vlan_pool_2 = {
    
    name = "two_tiers_com_vlan_pool_2"
    alloc_mode = "dynamic"
    from = "vlan-2101"
    to = "vlan-2200"
}
two_tiers_com_asa_phy_vlan_pool = {
    
    name = "two_tiers_com_asa_phy_vlan_pool"
    alloc_mode = "static"
    from = "vlan-2601"
    to = "vlan-2602"
}
ucsm_vlan_pool_1 = {
    
    name = "ucsm_vlan_pool_1"
    alloc_mode = "dynamic"
    from = "vlan-2201"
    to = "vlan-2300"
}
l3out_router_vlan = {
    
    name = "l3out_router_vlan"
    alloc_mode = "static"
    from = "vlan-3001"
    to = "vlan-3001"
}
two_tiers_bare_metal_vlan_pool = {
    
    name = "two_tiers_bare_metal_vlan_pool"
    alloc_mode = "static"
    from = "vlan-2901"
    to = "vlan-3000"
}
}
vmm_vmware = {
    
ucsm_vswitch = {
    
    provider_profile_dn = "uni/vmmp-VMware"
    name = "ucsm_vswitch"
    vlan_pool = "ucsm_vlan_pool_1"
    vcenter_host_or_ip = "10.74.202.163"
    vcenter_datacenter_name = "HX-DC"
    dvs_version = "6.6"
    aaep_name = "aaep_ucsm_vswitch_vmm_vcenter"
    esxi_hosts = ["10.74.202.50", "10.74.202.51", "10.74.202.52"]
    uplinks = ["vmnic4", "vmnic8"]
}
}
phydomain = {
    
asa_two_arm_fw_phydomain = {
    
    name = "asa_two_arm_fw_phydomain"
    vlan_pool = "two_tiers_com_asa_phy_vlan_pool"
    aaep_name = "aaep_two_tiers_com_asa_phydomain"
}
two_tiers_bare_metal_phydomain = {
    
    name = "two_tiers_bare_metal_phydomain"
    vlan_pool = "two_tiers_bare_metal_vlan_pool"
    aaep_name = "aaep_two_tiers_bare_metal_phydomain"
}
}
l3domain = {
    
router_l3domain = {
    
    name = "router_l3domain"
    vlan_pool = "l3out_router_vlan"
    aaep_name = "aaep_l3out_domain"
}
}
access_port_group_policy = {
    
leaf_access_port_101_1_20_phydomain = {
    
    name = "leaf_access_port_101_1_20_phydomain"
    lldp_status = "two_tiers_com_lldp_disable"
    cdp_status = "two_tiers_com_cdp_enable"
    aaep_name = "aaep_two_tiers_com_asa_phydomain"
    leaf_profile = "leaf-101-profile-asa-phydomain"
    leaf_block = [101]
    ports = [{
            
    from_card = 1
    from_port = 20
    to_card = 1
    to_port = 20
        }]
}
leaf_access_port_101_1_13_l3out = {
    
    name = "leaf_access_port_101_1_13_l3out"
    lldp_status = "two_tiers_com_lldp_disable"
    cdp_status = "two_tiers_com_cdp_enable"
    aaep_name = "aaep_l3out_domain"
    leaf_profile = "leaf-101-profile-l3out-domain"
    leaf_block = [101]
    ports = [{
            
    from_card = 1
    from_port = 13
    to_card = 1
    to_port = 13
        }]
}
}
vpc = {
    
leaf_access_port_105_106_1_15_vpc_vmm_vcenter = {
    
    name = "leaf_access_port_105_106_1_15_vpc_vmm_vcenter"
    lldp_status = "two_tiers_com_lldp_enable"
    cdp_status = "two_tiers_com_cdp_disable"
    port_channel_status = "two_tiers_com_lacp_active"
    aaep_name = "aaep_ucsm_vswitch_vmm_vcenter"
    leaf_profile = "leaf_105_106_profile_e1_15_vpc_vmm_vcenter"
    leaf_block = [105, 106]
    lag_t = "node"
    ports = [{
            
    from_card = 1
    from_port = 15
    to_card = 1
    to_port = 15
        }]
}
leaf_access_port_105_106_1_16_vpc_vmm_vcenter = {
    
    name = "leaf_access_port_105_106_1_16_vpc_vmm_vcenter"
    lldp_status = "two_tiers_com_lldp_enable"
    cdp_status = "two_tiers_com_cdp_disable"
    port_channel_status = "two_tiers_com_lacp_active"
    aaep_name = "aaep_ucsm_vswitch_vmm_vcenter"
    leaf_profile = "leaf_105_106_profile_e1_16_vpc_vmm_vcenter"
    leaf_block = [105, 106]
    lag_t = "node"
    ports = [{
            
    from_card = 1
    from_port = 16
    to_card = 1
    to_port = 16
        }]
}
leaf_access_port_105_106_1_17_vpc_vmm_vcenter = {
    
    name = "leaf_access_port_105_106_1_17_vpc_vmm_vcenter"
    lldp_status = "two_tiers_com_lldp_enable"
    cdp_status = "two_tiers_com_cdp_disable"
    port_channel_status = "two_tiers_com_lacp_active"
    aaep_name = "aaep_ucsm_vswitch_vmm_vcenter"
    leaf_profile = "leaf_105_106_profile_e1_17_vpc_vmm_vcenter"
    leaf_block = [105, 106]
    lag_t = "node"
    ports = [{
            
    from_card = 1
    from_port = 17
    to_card = 1
    to_port = 17
        }]
}
leaf_access_port_105_106_1_19_vpc_phydomain = {
    
    name = "leaf_access_port_105_106_1_19_vpc_phydomain"
    lldp_status = "two_tiers_com_lldp_enable"
    cdp_status = "two_tiers_com_cdp_enable"
    port_channel_status = "two_tiers_com_lacp_active"
    aaep_name = "aaep_two_tiers_bare_metal_phydomain"
    leaf_profile = "leaf_access_port_105_106_1_19_vpc_phydomain"
    leaf_block = [105, 106]
    lag_t = "node"
    ports = [{
            
    from_card = 1
    from_port = 19
    to_card = 1
    to_port = 19
        }]
}
}
sg = {
    
two-arm-fw = {
    
    name = "two-arm"
    service_node_type = "firewall"
    description = "two-arm-fw"
    devtype = "PHYSICAL"
    phydomain_name = "asa_two_arm_fw_phydomain"
    inside_vlan = "vlan-2601"
    outside_vlan = "vlan-2602"
    inside_leaf_block = "101"
    inside_card = "1"
    inside_port = "20"
    outside_leaf_block = "101"
    outside_card = "1"
    outside_port = "20"
    site_nodes = [{
            
    site_name = "aci_site1"
    tenant_name = "two_tiers_Company_Tenant"
    node_name = "two-arm-fw"
        }]
    contract_name = "Con_app_epg_to_database_epg"
    inside_bd_name = "fw_inside_bd"
    outside_bd_name = "fw_outside_bd"
    inside_pbr_name = "pbr-two-arm-fw-inside"
    outside_pbr_name = "pbr-two-arm-fw-outside"
}
}
pbr = {
    
pbr-two-arm-fw-inside = {
    
    ipsla_name = "insdie_ipsla_icmp"
    rh_grp_name = "inside_rh_grp"
    name = "pbr-two-arm-fw-inside"
    ip = "11.11.11.254"
    mac = "00:50:56:9a:99:22"
}
pbr-two-arm-fw-outside = {
    
    ipsla_name = "outside_ipsla_icmp"
    rh_grp_name = "outside_rh_grp"
    name = "pbr-two-arm-fw-outside"
    ip = "22.22.22.254"
    mac = "00:50:56:9a:00:e3"
}
}
tenant = {
    
    name = "two_tiers_Company_Tenant"
    description = "Tenant Created by Terraform"
}
anps = {
    
two_tiers_ap = {
    
    name = "two_tiers_ap"
    display_name = "two_tiers_ap"
}
}
vrfs = {
    
two_tiers_vrf = {
    
    name = "two_tiers_vrf"
    display_name = "two_tiers_vrf"
}
}
bds = {
    
web_bd = {
    
    name = "web_bd"
    display_name = "web_bd"
    vrf_name = "two_tiers_vrf"
    subnets = ["192.168.100.254/24", "192.168.101.254/24", "192.168.102.254/24", "192.168.103.254/24"]
}
app_bd = {
    
    name = "app_bd"
    display_name = "app_bd"
    vrf_name = "two_tiers_vrf"
    subnets = ["192.168.200.254/24"]
}
database_bd = {
    
    name = "database_bd"
    display_name = "database_bd"
    vrf_name = "two_tiers_vrf"
    subnets = ["192.168.201.254/24"]
}
fw_inside_bd = {
    
    name = "fw_inside_bd"
    display_name = "fw_inside_bd"
    vrf_name = "two_tiers_vrf"
    subnets = ["11.11.11.1/24"]
}
fw_outside_bd = {
    
    name = "fw_outside_bd"
    display_name = "fw_outside_bd"
    vrf_name = "two_tiers_vrf"
    subnets = ["22.22.22.1/24"]
}
}
epgs = {
    
web_epg = {
    
    name = "web_epg"
    display_name = "web_epg"
    anp_name = "two_tiers_ap"
    bd_name = "web_bd"
    dn = "ucsm_vswitch"
}
database_epg = {
    
    name = "database_epg"
    display_name = "database_epg"
    anp_name = "two_tiers_ap"
    bd_name = "database_bd"
    dn = "ucsm_vswitch"
}
app_epg = {
    
    name = "app_epg"
    display_name = "app_epg"
    anp_name = "two_tiers_ap"
    bd_name = "app_bd"
    dn = "ucsm_vswitch"
}
}
filters = {
    
filter_all = {
    
    name = "filter_all"
    display_name = "filter_all_display_name"
    entry_name = "filter_all_entry_name"
    entry_display_name = "filter_all_entry_display_name"
    ether_type = "unspecified"
    ip_protocol = "unspecified"
    destination_from = "unspecified"
    destination_to = "unspecified"
    stateful = "no"
}
tcp_40000 = {
    
    name = "tcp_40000"
    ether_type = "ip"
    ip_protocol = "tcp"
    destination_from = "40000"
    destination_to = "40000"
    stateful = "yes"
}
icmp = {
    
    name = "icmp"
    ether_type = "ip"
    ip_protocol = "icmp"
    stateful = "no"
}
tcp_22 = {
    
    name = "tcp_22"
    ether_type = "ip"
    ip_protocol = "tcp"
    destination_from = "ssh"
    destination_to = "ssh"
    stateful = "yes"
}
tcp_3306 = {
    
    name = "tcp_3306"
    ether_type = "ip"
    ip_protocol = "tcp"
    destination_from = "3306"
    destination_to = "3306"
    stateful = "yes"
}
}
contracts = {
    
Con_web_epg_to_app_epg = {
    
    contract_name = "Con_web_epg_to_app_epg"
    display_name = "Con_web_epg_to_app_epg"
    filter_type = "bothWay"
    scope = "tenant"
    filter_list = ["tcp_22", "tcp_3306"]
    directives = ["none"]
anp_epg_consumer = {
    
    anp_name = "two_tiers_ap"
    epg_name = "web_epg"
}
anp_epg_provider = {
    
    anp_name = "two_tiers_ap"
    epg_name = "app_epg"
}
}
Con_app_epg_to_database_epg = {
    
    contract_name = "Con_app_epg_to_database_epg"
    display_name = "Con_app_epg_to_database_epg"
    filter_type = "bothWay"
    scope = "tenant"
    filter_list = ["icmp", "tcp_40000"]
    directives = ["none"]
anp_epg_consumer = {
    
    anp_name = "two_tiers_ap"
    epg_name = "app_epg"
}
anp_epg_provider = {
    
    anp_name = "two_tiers_ap"
    epg_name = "database_epg"
}
}
}
l3outs = {
    
web_out_static_route = {
    
    name = "web_out_static_route"
    description = "static route from web epg to outside"
    vrf_name = "two_tiers_vrf"
    l3domain_name = "router_l3domain"
lnodes = {
    
    pod_name = "pod-1"
    leaf_block = "101"
    interface = "eth1/13"
    rtr_id = "1.1.1.1"
    ifInstT = "sub-interface"
    encap = "vlan-3001"
    addr = "172.172.172.1/30"
    ext_epg_name = "web_out_static_route_ext_epg"
    static_routes = [{
            
    subnet = "10.100.3.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }, {
            
    subnet = "10.100.4.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }, {
            
    subnet = "10.100.5.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }, {
            
    subnet = "10.100.6.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }, {
            
    subnet = "10.100.7.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }, {
            
    subnet = "10.100.8.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }, {
            
    subnet = "10.100.9.0/24"
    next_hop = "172.172.172.2"
    scope = ["shared-rtctrl", "export-rtctrl"]
        }]
}
}
}
ext_epg = {
    
}
static_vlan_epgs = {
    
web_epg = {
    
    name = "web_epg"
    display_name = "web_epg"
    anp_name = "two_tiers_ap"
    bd_name = "web_bd"
    dn = "two_tiers_bare_metal_phydomain"
    vpc_name = "leaf_access_port_105_106_1_19_vpc_phydomain"
    encap = "vlan-2901"
    mode = "regular"
}
}