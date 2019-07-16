# @summary 
#   sets the configuration of apache
# @example
#   include apache_test::config

class apache_test::config {
  file { 'apache_config':
    ensure => "$apache_test::config_ensure",
    path   => "$apache_test::config_path",
    source => "puppet:///modules/apache_test/${osfamily}.conf",
    mode   => "0644",
    owner   => "root",
    group  => "root",
  }
}
