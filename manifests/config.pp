# @!visibility private
class rancid::config {

  file { '/etc/rancid':
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }
}
