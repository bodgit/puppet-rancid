#
define rancid::device (
  Variant[Bodgitlib::Hostname, IP::Address::NoSubnet] $device  = $title,
  String[1]                                           $group,
  Rancid::Device                                      $type,
  Variant[Enum['up'], String[1]]                      $state,
  Optional[String]                                    $comment = undef,
) {

  rancid_device { "${group}/${device}":
    ensure  => present,
    type    => $type,
    state   => $state,
    comment => $comment,
  }

  # Possibly install per-type plugin/package
}
