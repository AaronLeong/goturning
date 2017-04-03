#!/bin/sh

set -e

echo "Training Data: 23GB download, 46GB total after decompression"
# Idempotent script that's efficient with repeated runs or interruptions


# -p suppresses error creating folder that already exists
mkdir -p tmp/training_data
cd tmp/training_data


# AlexNet
# http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/
mkdir -p alexnet
cd alexnet
# -c for continue => avoids repeated download & overwrites existing file
wget -c http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/poodle.png
wget -c http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/laska.png
wget -c http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/dog.png
wget -c http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/dog2.png
wget -c http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/quail227.JPEG
wget -c http://www.cs.toronto.edu/~guerzhoy/tf_alexnet/bvlc_alexnet.npy
cd ..


# Alov300
# http://www.alov300.org/
mkdir -p alov300
cd alov300
wget -c http://isis-data.science.uva.nl/alov/alov300++GT_txtFiles.zip
# -oq overwrite existing file, quieten unzip output
unzip -o alov300++GT_txtFiles.zip
wget -c http://isis-data.science.uva.nl/alov/alov300++_frames.zip
unzip -o alov300++_frames.zip
cd ..


# MSCOCO
# http://mscoco.org/dataset/#download (2015 Dataset)
mkdir -p mscoco
cd mscoco
wget -c http://msvocds.blob.core.windows.net/annotations-1-0-4/image_info_test2015.zip
unzip -o image_info_test2015.zip
wget -c http://msvocds.blob.core.windows.net/coco2015/test2015.zip
unzip -o test2015.zip
cd ..


# ImageNet
# TODO: implement once permission is granted


# VOT 2014
# http://www.votchallenge.net/vot2014/dataset.html
# Used for final validation
mkdir -p vot
cd vot
wget -c http://box.vicos.si/vot/vot2014.zip
unzip -o vot2014.zip
cd ..
