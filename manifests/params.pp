# = Class: git::params
#
# Configure how the puppet git module behaves
#
# == Parameters:
#
# $bin::      Path to git. Defaults to /usr/bin/git.
#
# $package::  Override the name of the git package(s) to include.
#
# == Usage:
#
# Example: Override the path to the git binary.
#
#   class {'git::params':
#     bin => '/usr/local/bin/git',
#   }
#
class git::params (
  $bin = '/usr/bin/git',
  $package = undef,
  $daemon_package = undef
) {

  $pkg = $package ? {
    undef   => $::operatingystem ? {
      /(?i:Debian|Ubuntu)/ => ['git-core'],
      default              => ['git'],
    },
    default => $package,
  }

  $daemonpkg = $daemon_package ? {
    undef => $::operatingsystem ? {
      /(?i:debian|ubuntu)/  => ['git-daemon-run'],
      default               => ['git-daemon'],
    },
    default => $daemon_package,
  }


}

}
