class glexecwn::repositories (
  $ensure      = 'present', #allows site admin to disable those repositories, if already present in their config.
  $umd_version = glexecwn::params::umd_version,
  ) {
  #
  # ensure that we get everything from UMD and not mix with EPEL unless we need
  # stuff from there
  #
  
  if($ensure == 'present') {
  
    Class['glexecwn::repositories'] -> Class['glexecwn::install']

    if ($osfamily == 'Redhat') and ($operatingsystemmajrelease == '6') {

        yumrepo { "UMD_${umd_version}_base_sl6":
            name => "UMD-${umd_version}-base",
            descr => "UMD ${umd_version} base (Scientific Linux 6)",
            baseurl => "http://repository.egi.eu/sw/production/umd/${umd_version}/sl6/\$basearch/base",
            protect => 1,
            enabled => 1,
            priority => 1,
            gpgcheck => 1,
            gpgkey => 'http://repository.egi.eu/sw/production/umd/UMD-RPM-PGP-KEY',
        }

        yumrepo { "UMD_${umd_version}_updates_sl6":
            name => "UMD-${umd_version}-updates",
            descr => "UMD ${umd_version} updates (Scientific Linux 6)",
            baseurl => "http://repository.egi.eu/sw/production/umd/${umd_version}/sl6/\$basearch/updates",
            protect => 1,
            enabled => 1,
            priority =>1,
            gpgcheck => 1,
            gpgkey => 'http://repository.egi.eu/sw/production/umd/UMD-RPM-PGP-KEY',
        }

    }

    if ($osfamily == 'Redhat') and ($operatingsystemmajrelease == '7') {

        yumrepo { "UMD_${umd_version}_base_centos7":
            name => "UMD-${umd_version}-base",
            descr => "UMD ${umd_version} base (CentOS 7)",
            baseurl => "http://repository.egi.eu/sw/production/umd/${umd_version}/centos7/\$basearch/base",
            protect => 1,
            enabled => 1,
            priority => 1,
            gpgcheck => 1,
            gpgkey => 'http://repository.egi.eu/sw/production/umd/UMD-RPM-PGP-KEY',
        }

        yumrepo { "UMD_${umd_version}_updates_centos7":
            name => "UMD-${umd_version}-updates",
            descr => "UMD ${umd_version} updates (CentOS 7)",
            baseurl => "http://repository.egi.eu/sw/production/umd/${umd_version}/centos7/\$basearch/updates",
            protect => 1,
            enabled => 1,
            priority =>1,
            gpgcheck => 1,
            gpgkey => 'http://repository.egi.eu/sw/production/umd/UMD-RPM-PGP-KEY',
        }

    }
   
  }
}

#    #  include 'emirepos::emi2repositories'
#    $major_release = regsubst($::operatingsystemrelease, '^(\d+)\.\d+$', '\1')
#  
#    yumrepo { "EMI_${emi_version}_base":
#      name     => "emi-${emi_version}-base",
#      descr    => 'EMI - $basearch - base',
#      baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/base",
#      gpgcheck => 1,
#      gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi",
#      enabled  => 1,
#      priority => 40,
#    }
#  
#    yumrepo { "EMI_${emi_version}_contribs":
#      name     => "emi-${emi_version}-contribs",
#      descr    => 'EMI - $basearch - contribs',
#      baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/contribs",
#      gpgcheck => 1,
#      gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi",
#      enabled  => 1,
#      priority => 40,
#    }
#  
#    yumrepo { "EMI_${emi_version}_third-party":
#      name     => "emi-${emi_version}-third-party",
#      descr    => 'EMI - $basearch - third-party',
#      baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/third-party",
#      gpgcheck => 1,
#      gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi",
#      enabled  => 1,
#      priority => 40,
#    }
#  
#    yumrepo { "EMI_${emi_version}_updates":
#      name     => "emi-${emi_version}-updates",
#      descr    => 'EMI - $basearch - updates',
#      baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/updates",
#      gpgcheck => 1,
#      gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi",
#      enabled  => 1,
#      priority => 40,
#    }
#  } #end of ensure
#
#  #
#  # upgrade path conflicts
#  #
#
#  # conflict with voms-client3
#  # package {voms-clients:
#  #  ensure => absent,
#  #}
