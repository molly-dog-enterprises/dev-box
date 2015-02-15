include apt
include git
include nodejs

# setup ruby 2.1 for the tipper application
apt::ppa{ 'ppa:brightbox/ruby-ng': }
class { 'ruby':
  require            => Apt::Ppa['ppa:brightbox/ruby-ng'],
  version            => '2.1',
  set_system_default => true

}

class { 'ruby::dev':
  ruby_dev_packages  => ['ruby2.1-dev', 'zlib1g-dev', 'libpq-dev']
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
