package Distro::Repository;

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
use lib "$ENV{OSCAR_HOME}/lib";
use OSCAR::Logger;
use OSCAR::Distro;
use OSCAR::Package;
use vars qw(@EXPORT);
use base qw(Exporter);
@EXPORT = qw(check_local_repository);

#
# Utility function to read a file into a returned string
#
sub read_file {
  my $filename = shift;

  my $content = "";
  my @lines;
  if (-f $filename) {
    open(INFO, $filename) or die("Impossible to open the file $filename");
    @lines = <INFO>;
    close(FILE);
  }

  return @lines;
}
                                                                    
# Deprecated
sub get_debian_packages
{
  system ("apt-get clean\n");
  my ($distroname, $distroversion) = which_distro('/tftpboot/deb');
  oscar_log_subsection("get_debian_packages: Identified distro of clients: $distroname $distroversion");
  my $pkg_list_file = "/opt/oscar/oscarsamples/$distroname-$distroversion-i386.rpmlist";
  oscar_log_subsection("Using RPM list: $pkg_list_file");
  my @pkgs = read_file($pkg_list_file);
  foreach my $pkg (@pkgs) {
#    my @debs = rpmlist($pkg, "oscar_clients");
#    foreach my $deb (@debs) {
      system ("apt-get install -d --assume-yes $pkg\n");
#    }
  }    
  system("cp -f /var/cache/apt/archives/*.deb /tftpboot/deb");
}

sub check_local_repository
{
  oscar_log_subsection("Quick sanity check for the local Debian repository in /tftpboot/debian");
  if (! -d "/tftpboot/debian") {
    print("ERROR: the local Debian repository in the /tftpboot/debian directory does not exist.  You must create this repository running the script create_local_debian_repository.\n");
  die("Cannot continue");
  }

  # Install a set of packages needed on the head node
  system ("apt-get -y install daemon dhcp");
  # OSCAR use the file /etc/init.d/dhcpd instead of /etc/init.d/dhcp on debian, so we create a link
  system ("ln -s /etc/init.d/dhcp /etc/init.d/dhcpd");
}
