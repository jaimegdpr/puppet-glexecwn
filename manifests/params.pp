class glexecwn::params {
  $argus_server       = hiera('argus_server', 'localhost')
  $argus_port         = hiera('argus_port', '8154')

  $umd_version        = hiera('umd_version', 4)

  $glexec_location    = hiera('glexec_location', '/usr')
  $glexec_permissions = hiera('glexec_permissions', '6111')

  $glite_env_set      = hiera('glite_env_set', true)
  $glite_location     = hiera('glite_location', '/usr')
  $glite_location_var = hiera('glite_location_var', '/var')

  $gridenvfile        = hiera('gridenvfile', '/etc/profile.d/grid-env.sh')
  $gridmapdir         = hiera('gridmapdir', '/etc/grid-security/gridmapdir')
  $grid_env_location  = hiera('grid_env_location', '/usr/libexec')

  $gt_proxy_mode      = hiera('gt_proxy_mode', 'old')

  $install_dummydpm   = hiera('install_dummydpm', true)
  $install_emi_wn     = hiera('install_emi_wn', true)

  $myproxy_server     = hiera('myproxy_server', 'localhost')

  $lcg_gfal_infosys   = hiera('lcg_gfal_infosys', 'unset')
  $lcg_location       = hiera('lcg_location', '/usr')

  $site_name          = hiera('site_name', 'unset')
#  $srm_path           = hiera('srm_path', '/opt/d-cache/srm')
  $subcluster_name    = hiera('subcluster_name', 'unset')
  $supported_vos      = hiera('supported_vos', [
    'atlas',
    'cms',
    'lhcb',
    'alice',
    'dteam',
    'ops',
    'vo.aleph.cern.ch',
    'vo.delphi.cern.ch',
    'vo.l3.cern.ch',
    'vo.opal.cern.ch',
    'ilc',
    'envirogrids.vo.eu-egee.org',
    'geant4',
    'na48',
    'unosat',
    'vo.gear.cern.ch',
    'vo.sixt.cern.ch'])

  $user_white_list    = hiera('user_white_list', ' ')
}
