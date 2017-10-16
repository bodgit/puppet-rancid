#
class rancid::params {

  case $::osfamily {
    'RedHat': {
      $package_name = 'rancid',
    },
    default: {
      fail('')
    }
  }
}
