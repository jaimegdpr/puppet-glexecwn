class glexecwn::wninfo(
  $subcluster_name    = $glexecwn::params::subcluster_name,
){
  file {'/etc/glite-wn-info':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',    
  }
  
  file {'/etc/glite-wn-info/glite-wn-info.conf':
    ensure => present,
    content => template('glexecwn/wninfo.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => File['/etc/glite-wn-info'],
  } 
}
