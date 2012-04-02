# = Class: git::web
#
# Description of git::web
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
class git::web::install {

  require git::web::params
  $webpkg = $::git::web::params::pkg

  package {$webpkg:
    ensure => 'installed',
  }

}

