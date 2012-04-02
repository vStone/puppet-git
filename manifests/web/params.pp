# = Class: git::web::params
#
# Configure settings for git
#
# == Parameters:
#
# $package::  Overrides the packages to be installed. Defaults to os specific.
#
# == Sample Usage:
#
#   class {'git::web::params':
#     packages => 'value'
#   }
#
class git::web::params (
  $packages = undef
){

  #####################################
  #             Packages              #
  #####################################
  $pkgs = $packages ? {
    undef   => $::operatingsystem ? {
      default              => ['gitweb'],
    },
    default => $packages,
  }

  $webroot = $::operatingsystem ? {
    default => '/var/www/git',
  }

  $webconf = $::operatingsystem ? {
    default => '/etc/httpd/conf.d/git.conf',
  }

}

