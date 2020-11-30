resource "oci_core_security_list" "ELKSecurityList" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.ELKVCN.id
  display_name   = "ELKSecurityList"

  egress_security_rules {
      protocol    = "6"
      destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = var.ESDataPort
      min = var.ESDataPort
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = var.KibanaPort
      min = var.KibanaPort
    }
  }
}
