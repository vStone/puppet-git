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

  require git::params
  $webpkg = $git::params::webpkg

  package {$webpkg:
    ensure => 'installed',
  }

}

