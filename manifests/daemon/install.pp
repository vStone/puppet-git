# = Class: git::daemon
#
# Description of git::daemon
#
# == Parameters:
#
# $param::   Description of parameter
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
class git::daemon::install {

  require ::git::params
  $daemonpkg  = $::git::params::daemonpkg

  package {$daemonpkg:
    ensure => 'installed',
  }

}

