class glexecwn::env (
  $gridenvfile        = $glexecwn::params::gridenvfile,
  $srm_path           = $glexecwn::params::srm_path,
  $site_name          = $glexecwn::params::site_name,
  $myproxy_server     = $glexecwn::params::myproxy_server,
  $lcg_gfal_infosys   = $glexecwn::params::lcg_gfal_infosys,
  $lcg_location       = $glexecwn::params::lcg_location,
  $gt_proxy_mode      = $glexecwn::params::gt_proxy_mode,
  $grid_env_location  = $glexecwn::params::grid_env_location,
  $gridmapdir         = $glexecwn::params::gridmapdir,
  $glite_location     = $glexecwn::params::glite_location,
  $glite_location_var = $glexecwn::params::glite_location_var,
  $glite_env_set      = $glexecwn::params::glite_env_set,
  $glexec_location    = $glexecwn::params::glexec_location,) {
  concat { $gridenvfile:
    owner => 'root',
    group => 'root',
    mode  => '0755',
    warn  => true,
  }

  concat::fragment { 'grid-env header':
    target  => $gridenvfile,
    order   => '01',
    content => template('glexecwn/gridenvsh_header.erb')
  }

  concat::fragment { 'grid-env footer':
    target  => $gridenvfile,
    order   => '99',
    content => template('glexecwn/gridenvsh_footer.erb')
  }

  file { '/etc/profile.d/grid-env.csh':
    ensure  => present,
    content => template('glexecwn/gridenvcsh.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # site-env
  concat::fragment { 'site-env global':
    target  => $gridenvfile,
    order   => '55',
    content => template('glexecwn/gridenv-site.sh.erb')
  }
}
