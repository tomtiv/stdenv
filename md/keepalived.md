global_defs {

# UNIQUE
router_id pihole-dns-01
script_user root
enable_script_security
}

vrrp_script chk_ftl {
script "/etc/scripts/chk_ftl"
interval 1
weight -10
}

vrrp_instance PIHOLE {
state MASTER
interface eth0
virtual_router_id 55
priority 150
advert_int 1
unicast_src_ip 192.168.0.100
unicast_peer {
192.168.0.102
}

authentication {
auth_type PASS
auth_pass tt
}

virtual_ipaddress {
192.168.0.11/24
}

track_script {
chk_ftl
}

}
