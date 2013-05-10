#!/bin/bash

set -e

PACKAGE_DIR=$(rospack find slam_plus_plus)

$SLAM_PP_URL/slam_plus_plus_src/bin/slam_plus_plus -i data/manhattanOlson3500.txt --pose-only
