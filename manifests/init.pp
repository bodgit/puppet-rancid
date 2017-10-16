#
class rancid (
  String $package_name = $::rancid::params::package_name,
) inherits ::rancid::params {

  contain ::rancid::install
  contain ::rancid::config

  Class['::rancid::install'] -> Class['::rancid::config']
}
