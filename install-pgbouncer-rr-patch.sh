#!/bin/bash

#
# Copyright 2015-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License").
# You may not use this file except in compliance with the License. A copy of the License is located at
#
#  http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file.
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or implied. 
# See the License for the specific language governing permissions and limitations under the License.
#
# pgbouncer-rr-patch: 
# Script to patch pgbouncer distribution with pgbouncer-rr enhancements
#

USAGE="Usage: $0 <pgbouncer dir>"
usage() {
   echo $USAGE
   exit 1
}

PGDIR=$1
[ -z "$PGDIR" ] && usage

PATCHDIR=$(pwd)
patchstatus=0

echo Merging pgbouncer-rr changes to: $PGDIR/src/server.c
patch -d $PGDIR -f -b -p1 < $PATCHDIR/src/server.c.diff || patchstatus=1

exit $patchstatus
