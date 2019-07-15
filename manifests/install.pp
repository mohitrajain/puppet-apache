# @summary 
#   Installs the base apache packages
#
#
class apache_test::install {

# service should be installed
  package { "${apache_test::install_name}":
    ensure => present,
  }

# service should be running
  service { "${apache_test::install_name}":
    ensure => 'running',
    enable => true
  }
}
