file { "/var/tmp/testdir":
  ensure => "directory",
}

file { "/var/tmp/testdir/testfile":
  ensure => "present",
}
