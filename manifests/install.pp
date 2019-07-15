# @summary 
#   Installs the base apache packages
#
#
class apache_test::install {
  package { 'httpd':
    ensure => present,
  }
}
