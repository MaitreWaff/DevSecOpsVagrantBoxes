class motd {
  $message = "Welcome to the Magic of Puppet Automation\n"
  file { "/etc/motd":
    ensure => "present",
    content => "$message",
  }
}
