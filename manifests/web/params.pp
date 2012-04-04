# = Class: git::web::params
#
# Configure settings for git
#
# == Parameters:
#
# $package::                    Overrides the packages to be installed.
#                               Defaults to os specific.
#
# $projectroot::                Set the path to git projects. This is an
#                               absolute filesystem path which will be
#                               prepended to the project path.
#
# $git_base_url_list::          Set the list of git base URLs used for URL to
#                               where fetch project from. I.e. the full URL is
#                               "$git_base_url/$project".
#                               By default this is empty.
#
# $feature_blame_default::      Enable the 'blame' blob view, showing the last
#                               commit that modified each line in the file.
#                               This can be very CPU-intensive.
#                               Disabled by default.
#
# $feature_blame_override::     Allow projects to override the default setting
#                               via git config file.
#                               Example: gitweb.blame = 0|1;
#                               Defaults to true.
#
# $feature_snapshot_default::   Disable the 'snapshot' link, providing a
#                               compressed archive of any tree. This can
#                               potentially generate high traffic if you have
#                               have large project. Enabled for .tar.gz
#                               snapshots by default.
#
#                               Value is a list of formats defined in
#                               %known_snapshot_formats that you wish to offer.
#
#                               Unconfigured by default.
#
# $feature_snapshot_override::  Allow projects to override the default setting
#                               via git config file.
#                               Example: gitweb.snapshot = tbz2,zip;
#                               (use "none" to disable)
#                               Defaults to true.
#
# $feature_grep_default::       Disable grep search, which will list the files
#                               in currently selected tree containing the given
#                               string. This can be potentially CPU-intensive,
#                               of course. Enabled by default.
#
# $feature_grep_override::      Allow projects to override the default setting
#                               via git config file. Example: gitweb.grep = 0|1;
#                               Defaults to true.
#
# $feature_pickaxe_default::    Disable the pickaxe search, which will list the
#                               commits that modified a given string in a file.
#                               This can be practical and quite faster
#                               alternative to 'blame', but still potentially
#                               CPU-intensive. Enabled by default.
#
# $feature_pickaxe_override::   Allow projects to override the default setting
#                               via git config file.
#                               Example: gitweb.pickaxe = 0|1;
#                               Enabled by default.
#
# == Sample Usage:
#
#   class {'git::web::params':
#     packages => 'value'
#   }
#
class git::web::params (
  $packages = undef,
  $projectroot = '/var/lib/git',
  $git_base_url_list = [],
  $feature_blame_default = false,
  $feature_blame_override = true,
  $feature_snapshot_default = [],
  $feature_snapshot_override = true,
  $feature_grep_default = false,
  $feature_grep_override = true,
  $feature_pickaxe_default = false,
  $feature_pickaxe_override = true
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

