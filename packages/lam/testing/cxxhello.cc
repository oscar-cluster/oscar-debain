// -*- c++ -*-
//
// $Id$
//
// Copyright 2004, Open Cluster Group
// 
// This file is part of the OSCAR distribution from the Open Cluster
// Group.  See the OSCAR and OCG web pages:
// 
// 	http://oscar.sourceforge.net/
// 	http://www.openclustergroup.org/
// 
// The OSCAR framework is covered by the GNU General Public License.  See
// the COPYING file in the top-level OSCAR directory.  Software packages
// that are included in an OSCAR distribution have their own licenses.
// 
// -------------------------------------------------------------------------
//

#include <iostream>
#include "mpi.h"

using namespace std;


int
main(int argc, char *argv[])
{
  MPI::Init(argc, argv);
  
  int rank = MPI::COMM_WORLD.Get_rank();
  int size = MPI::COMM_WORLD.Get_size();

  cout << "Hello World! I am " << rank << " of " << size << endl;
  
  MPI::Finalize();
  return 0;
}
