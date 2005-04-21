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

sub check_local_repository
{
  if (! -d "/tftpboot/rpm") {
    print("ERROR: /tftpboot/rpm directory does not exist.  You must create this directory\nand copy all of your distro RPMs there before running install_cluster.\n");
    die("Cannot continue");
  }
}

