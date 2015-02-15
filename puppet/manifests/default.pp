include apt
include git
include nodejs
include mollydog-ruby
include mollydog-postgresql

$enhancers = [ 'screen', 'strace', 'sudo' ]
package { $enhancers:
  ensure => 'installed'
}