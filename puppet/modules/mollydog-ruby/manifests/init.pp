# == Class: mollydog-ruby
#
# === Examples
#
#  class { 'mollydog-ruby': }
#
# === Authors
#
# Author Name <phil@mollydog.com>
#
# === Copyright
#
# Copyright 2015.
#
class mollydog-ruby {
  $enhancers = [ 'g++', 'build-essential', 'zlib1g-dev',  'libssl-dev', 'libreadline6-dev', 'libyaml-dev' ]
  package { $enhancers:
    ensure => 'installed'
  }

  apt::ppa{ 'ppa:brightbox/ruby-ng': }
  class { 'ruby':
    require            => Apt::Ppa['ppa:brightbox/ruby-ng'],
    version            => '2.1',
    set_system_default => true
  }
  class { 'ruby::dev':
    ruby_dev_packages  => ['ruby2.1-dev']
  }
}
