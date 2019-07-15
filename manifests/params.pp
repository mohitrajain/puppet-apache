# @summary 
#   Params will handle os compatibility using facts
#

class apache_test::params {
  $params_ensure = 'present'

  case $facts['os']['family'] {
    'RedHat': {
      $params_name = 'httpd'
    }
    'Debian': {
      $params_name = 'apache2'
    }
  }
}
