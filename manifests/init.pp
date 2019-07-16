# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache_test
class apache_test (
  String $install_name,
  String $install_ensure, 
  String $config_path,
  String $config_ensure,
  String $vhosts_owner,
  String $vhosts_group,
  String $vhosts_dir,
) {
  contain apache_test::install
  contain apache_test::config

  Class['::apache_test::install']
  -> Class['::apache_test::config']
}
