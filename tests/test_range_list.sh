#!/bin/bash
#
# Library range list type testing script
#
# Copyright (c) 2006-2013, Joachim Metz <joachim.metz@gmail.com>
#
# Refer to AUTHORS for acknowledgements.
#
# This software is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this software.  If not, see <http://www.gnu.org/licenses/>.
#

EXIT_SUCCESS=0;
EXIT_FAILURE=1;
EXIT_IGNORE=77;

test_range_list()
{ 
	echo "Testing read offset of input:" $*;

	./${CDATA_TEST_RANGE_LIST} $*;

	RESULT=$?;

	echo "";

	return ${RESULT};
}

CDATA_TEST_RANGE_LIST="cdata_test_range_list";

if ! test -x ${CDATA_TEST_RANGE_LIST};
then
	CDATA_TEST_RANGE_LIST="cdata_test_range_list.exe";
fi

if ! test -x ${CDATA_TEST_RANGE_LIST};
then
	echo "Missing executable: ${CDATA_TEST_RANGE_LIST}";

	exit ${EXIT_FAILURE};
fi

if ! test_range_list ${FILENAME};
then
	exit ${EXIT_FAILURE};
fi

exit ${EXIT_SUCCESS};
