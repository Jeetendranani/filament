#!/bin/bash

# Usage: the first argument selects the build type:
# - release, to build release only
# - debug, to build debug only
# - continuous, to build release and debug
# - presubmit, for presubmit builds
#
# The default is release

set -e
set -x

# build-common.sh will generate the following variables:
#     $GENERATE_ARCHIVES
#     $BUILD_DEBUG
#     $BUILD_RELEASE
source `dirname $0`/ci-common.sh
source `dirname $0`/build-common.sh

pushd `dirname $0`/../.. > /dev/null
./build.sh -c $GENERATE_ARCHIVES $BUILD_DEBUG $BUILD_RELEASE
