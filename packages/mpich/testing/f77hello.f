c
c	$Id$
c
c Copyright 2004, Open Cluster Group
c 
c This file is part of the OSCAR distribution from the Open Cluster
c Group.  See the OSCAR and OCG web pages:
c 
c 	http://oscar.sourceforge.net/
c 	http://www.openclustergroup.org/
c 
c The OSCAR framework is covered by the GNU General Public License.  See
c the COPYING file in the top-level OSCAR directory.  Software packages
c that are included in an OSCAR distribution have their own licenses.
c 
c -------------------------------------------------------------------------
c
	program hello
	include 'mpif.h'
	integer rank
	integer size

	call MPI_INIT(ierror)
	call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
	call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)

	print *, 'Hello World! I am ', rank, ' of ', size

	call MPI_FINALIZE(ierror)
	stop
	end
