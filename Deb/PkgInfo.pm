package Distro::PkgInfo;

#   $Id$

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
 
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
 
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

#   Copyright 2005 INRIA
#     Geoffroy Vallee <gvallee@irisa.fr>
#

use strict;
use vars qw($VERSION @EXPORT);
use Carp;
use base qw(Exporter);
@EXPORT = qw(which_perlQt_name which_perltk_name get_pkg_dir get_package_version get_pkg_list_in_dir remove_pkg);

sub which_perlQt_name
{
    return "libqt-perl";
}

sub which_perltk_name 
{
  return "perl-tk";
}

sub get_pkg_dir 
{
  my $dir = shift;
  return "$dir/Debs";
}

sub get_package_version # ($package) -> package name
{
  my $package = shift;
  my $version = -1;

  $_=`dpkg --status $package`;
  # two ways to set a package number	  
  m/Version: (\d+):(\d+).(.*)\n/;
  if (length($2) > 0) {
    $version=$2;
  }
  else {
    m/Version: (\d+).(.*)\n/;
    if (length($1) > 0) {
      $version=$1;
    }
  }
  return $version;
}

sub get_pkg_list_in_dir
{
  my $dir = shift;
  my @pkgs;

  opendir(DIR, "$dir") || croak("Can't open $dir");
  @pkgs = grep { /.deb/ } readdir(DIR);
  
  closedir DIR;

  return @pkgs;
}

sub remove_pkg 
{
    my $pkg = shift;
    system ("apt-get remove $pkg\n") or die ("Impossible to remove the package $pkg");
}

1;
