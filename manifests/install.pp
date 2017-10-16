# @!visibility private
class rancid::install {

  package { $::rancid::package_name:
    ensure => present,
  }
}
