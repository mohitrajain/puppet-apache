# @summary 
#   vhosts resource type which will define multiple hosts
#
# @example
#  apache_test::vhosts { 'vhost_1':
#    port        => 80,
#    domain      => "centos.internal.directi.com",
#    serveralias => "centos",
#    admin       => "root",
#    docroot     => "/var/www/html/puppetproject"
#  }


define apache_test::vhosts (
  Integer $port,
  String[1] $domain,
  String $serveralias,
  String $admin,
  String $docroot,
) {

  file { "$docroot":
    ensure => 'directory',
    owner  => $apache_test::vhosts_owner,
    group  => $apache_test::vhosts_group
  }

  file { "${apache_test::vhosts_dir}/${serveralias}.conf":
    ensure => 'file',
    owner  => $apache::vhosts_owner,
    group  => $apache_test::vhosts_group,
    mode   => '0664',
    content => epp('apache_test/vhosts.conf.epp',{'port'=> $port, 'domain' => $domain, 'serveralias' => $serveralias, 'admin' => $admin, 'docroot' => $docroot}),
    notify => Service['apache_service'] 
  }
}
