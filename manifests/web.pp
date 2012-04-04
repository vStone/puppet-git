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
# A webserver that is running :)
#
# == Sample Usage:
#
class git::web {
  class {'git::web::install': } ~>
  class {'git::web::setup': }
}

