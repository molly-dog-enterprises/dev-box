# == Class: mollydog-postgresql
# === Examples
#
#  class { 'mollydog-postgresql': }
#
# === Authors
#
# Author Name <phil@mollydog.com>
#
# === Copyright
#
# Copyright 2015.
#
class mollydog-postgresql {
  package {'libpq-dev':
    ensure => "installed"
  }

  # setup postgres for the tipper application
  class { 'postgresql::server': }
  postgresql::server::db { 'tipper_development':
    user     => 'vagrant',
    password => postgresql_password('vagrant', 'vagrant'),
  }
  postgresql::server::db { 'tipper_test':
    user     => 'vagrant',
    password => postgresql_password('vagrant', 'vagrant'),
  }
}
