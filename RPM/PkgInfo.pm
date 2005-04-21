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
@EXPORT = qw(which_perltk_name get_pkg_dir get_package_version get_pkg_list_in_dir);

sub which_perltk_name 
{
  return "perl-Tk";
}

sub get_pkg_dir 
{
  my $dir = shift;
  return "$dir/RPM";
}

sub get_package_version # ($package) -> package name
{
  open(CMD,"rpm -q $package |");
  my $cmd_output = <CMD>;
  close CMD;
  if (length($cmd_output) <= 0) {
    $version =~ /$package-(\d+)/;
  }
}

sub get_pkg_list_in_dir
{
  my $dir = shift;
  my @pkgs;

  opendir(DIR, "$dir") || croak("Can't open $dir");
  @pkgs = grep { /.rpm/ } readdir(DIR);
  
  closedir DIR;

  return @pkgs;
}

1;
