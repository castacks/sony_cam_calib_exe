#!/bin/bash

# Assuming inside a Docker container that is launched by the start_calib_container.sh script in
# sony_docker/script directory.

OUT_DIR=$1
BAGFILE=$2

source /opt/ros/noetic/setup.bash

cd /catkin_ws && source devel/setup.bash

# Make sure we have the target output direcotry.
mkdir -p $OUT_DIR

rosrun kalibr tartan_calibrate \
    --bag ${BAGFILE} \
    --target /script/targets/april_airlab.yaml \
    --topics /image \
    --min-init-corners-autocomplete 29 \
    --min-tag-size-autocomplete 2 \
    --correction-threshold 10.1 \
    --models pinhole-radtan \
    --dont-show-report \
    --save_dir ${OUT_DIR}/

echo "Done $0. "