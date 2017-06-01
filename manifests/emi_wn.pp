class glexecwn::emi_wn {

  #
  # in the CERN case we have merged the UI and the WN setup therefore some packages are already defined at this point. 
  #
  if $::cern_network_domain {
    case $::operatingsystemmajorrelease {
      5:
        {
          package {['a1_grid_env','c-ares','cleanup-grid-accounts','dcache-srmclient','emi.amga.amga-cli','emi.saga-adapter.context-cpp','emi.saga-adapter.isn-cpp','emi.saga-adapter.sd-cpp']:
            ensure => present,
          }
          package {['dcap','dcap-devel','dcap-libs','dcap-tunnel-gsi','dcap-tunnel-krb','dcap-tunnel-ssl','dcap-tunnel-telnet']:
            ensure => present,
          }
          package {['dpm-libs','dpm-devel','dpm-perl','dpm-python','dpm-python26']:
            ensure => present,
          }
          package {['glite-jobid-api-c','glite-lb-client','glite-lb-common','glite-lb-client-progs','glite-lbjp-common-gss','glite-lbjp-common-trio','glite-service-discovery-api-c','glite-wms-brokerinfo-access','glite-wn-info','glite-yaim-clients','glite-yaim-core','lcg-ManageVOTag','lcg-tags','lcg-util-python26','lfc-devel','lfc-python26','openldap-clients','python-ldap']:
            ensure => present,
          }
        }
        
      6:
        {
          package {['a1_grid_env','c-ares','cleanup-grid-accounts','dcache-srmclient','emi.amga.amga-cli','emi.saga-adapter.context-cpp','emi.saga-adapter.isn-cpp','emi.saga-adapter.sd-cpp']:
            ensure => present,
          }
          package {['dcap','dcap-devel','dcap-libs','dcap-tunnel-gsi','dcap-tunnel-krb','dcap-tunnel-ssl','dcap-tunnel-telnet']:
            ensure => present,
          }
          package {['dpm-libs','dpm-devel','dpm-perl','dpm-python']:
            ensure => present,
          }
          package {['glite-jobid-api-c','glite-lb-client','glite-lb-common','glite-lb-client-progs','glite-lbjp-common-gss','glite-lbjp-common-trio','glite-service-discovery-api-c','glite-wms-brokerinfo-access','glite-wn-info','glite-yaim-clients','glite-yaim-core','lcg-ManageVOTag','lcg-tags','lfc-devel','openldap-clients','python-ldap']:
            ensure => present,
          }
        }
          
        default:
          {
            package {emi-wn:
               ensure => present,
            }
          }
    }
    } else {
    
    #
    # for all other cases we follow the standart procedures 
    #
    package {emi-wn:
      ensure => present,
    }
    }
}
