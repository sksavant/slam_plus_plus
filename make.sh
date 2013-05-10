#!/bin/bash

set -e

PACKAGE_DIR=$(rospack find slam_plus_plus)
echo "### downloading and unpacking slam_plus_plus to" $PACKAGE_DIR "###"


SLAM_PP_URL="svn://svn.code.sf.net/p/slam-plus-plus/code/trunk"
SLAM_PP_PATH="slam_plus_plus_src"
SLAM_PP_REVISION=9 #ICRA 2013

#clone or update the sources
svn co $SLAM_PP_URL $PACKAGE_DIR/$SLAM_PP_PATH/ -r $SLAM_PP_REVISION

echo "### building SLAM plus plus ###"

mkdir -p $PACKAGE_DIR/$SLAM_PP_PATH/build && cd $PACKAGE_DIR/$SLAM_PP_PATH/build

cmake ..
make -j8 -l8

rm -rf $PACKAGE_DIR/bin
rm -rf $PACKAGE_DIR/lib

cp -R $PACKAGE_DIR/$SLAM_PP_PATH/build/lib $PACKAGE_DIR/lib
cp -R $PACKAGE_DIR/$SLAM_PP_PATH/build/bin $PACKAGE_DIR/bin

