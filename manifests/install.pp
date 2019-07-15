# @summary 
#   Installs the base apache packages
#
#
class apache_test::install( 
  $install_name   = $apache_test::params::params_name,
  $install_ensure = $apache_test::params::params_ensure,
) inherits apache_test::params {

# service should be installed
  package { "$install_name":
    ensure => $install_ensure,
  }

# service should be running
  service { "$install_name":
    ensure => 'running'
  }
}
