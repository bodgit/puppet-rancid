#
define rancid::device (
  Bodgitlib::Hostname            $device   = $title,
  Rancid::Device                 $type,
  Variant[Enum['up'], String[1]] $state,
  Optional[String]               $comments = undef,
) {
}
