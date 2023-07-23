file { "/var/tmp/testfile":
  ensure  => "present",
  owner   => "maitrewaff",
  group   => "maitrewaff",
  mode    => "0777",
  content => "Hello and Welcome tot this Lab on Puppet Fundamentals.\n",
}
