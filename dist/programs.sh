#!/bin/sh
#
# Copyright (c) 2002-2003 The Trustees of Indiana University.  
#                         All rights reserved.
# 
# This file is part of the OSCAR software package.  For license
# information, see the COPYING file in the top level directory of the
# OSCAR source distribution.
#
# $Id$
#

LATEX="latex"
PDFLATEX="pdflatex"
DVIPS="dvips"
FIG2DEV="no"
PNGTOPNM="pngtopnm"
PNMTOPS="pnmtops"
LATEX2HTML="no"
LATEX2HTML_OPTIONS="--split=6 -local_icons -long_titles 3 -auto_navigation --html_version=4.0 -show_section_numbers"

# Do *not* put an exit statement here!  This file is sourced from
# other shell scripts; putting an "exit" statement here will cause the
# sourcing scripts to exit.
