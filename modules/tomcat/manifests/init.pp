class tomcat {
  package { "tomcat7":
    ensure => installed,
  }

  package { "maven":
    ensure => installed,
  }

  package { "tomcat7-admin":
    ensure => installed,
    require => Package["tomcat7"]
  }

  package { "libtcnative-1":
    ensure => installed,
    require => Package["tomcat7"]
  }

  file { "/etc/tomcat7/server.xml":
    ensure => file,
    owner  => root,
    require => Package["tomcat7"],
    notify => Service["tomcat7"],
    source => "Puppet:///modules/tomcat/server.xml"
  }

  file { "/etc/tomcat7/tomcat-users.xml":
    ensure => file,
    owner  => root,
    require => Package["tomcat7"],
    notify => Service["tomcat7"],
    source => "Puppet:///modules/tomcat/tomcat-users.xml"
  }

  file { "/etc/tomcat7/context.xml":
    ensure => file,
    owner  => root,
    require => Package["tomcat7"],
    notify => Service["tomcat7"],
    source => "Puppet:///modules/tomcat/context.xml"
  }

  service { "tomcat7":
    enable => true,
    ensure => running,
    require => Package["tomcat7"],
  }
}
