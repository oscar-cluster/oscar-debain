package Deb::Repository;

use strict;
use lib "$ENV{OSCAR_HOME}/lib";
use OSCAR::Logger;
use OSCAR::Distro;
use OSCAR::Package;
use vars qw(@EXPORT);
use base qw(Exporter);
@EXPORT = qw(get_debian_packages);

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
