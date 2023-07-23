# Definition of a class
class ntpdemo {
  # NTP Package installation
  package { "ntp":
    ensure => "present",
  }

  # NTP file configuration
  file { "/etc/ntp.conf":
    ensure => "present",
    content => "server 0.centos.pool.ntp.org iburst\n",
  }

  # NTP Service startup
  service { "ntpd":
    ensure => "running",
  }
}
