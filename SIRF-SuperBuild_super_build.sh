#!/bin/bash

#Copyright University College London 2020
#Author: Ander Biguri, Institute of Nuclear Medicine, UCL
#Author: Alexander Whitehead, Institute of Nuclear Medicine, UCL
#For internal research only.

if [ $# == 2 ]
then
    if [ $1 == "-c" -o $1 == "--clone" ]
    then
        echo -e "cloning superbuild\n"
        
        rm -r ./SIRF-SuperBuild
        
        git clone https://github.com/ALEXJAZZ008008/SIRF-SuperBuild.git
        git checkout STIR_DISABLE_ITK_fix
        
        echo -e "cleaning build directory\n"
        
        rm -r ./SIRF-SuperBuild_build
        rm -r ./SIRF-SuperBuild_install
        rm -r ./SIRF-SuperBuild_install;
    else
        if [ $1 == "-r" -o $1 == "--rm" ]
        then
            echo -e "cleaning build directory\n"
            
            rm -r ./SIRF-SuperBuild_build
            rm -r ./SIRF-SuperBuild_install
            rm -r ./SIRF-SuperBuild_install;
        fi
    fi
    
    $1=$2
fi

echo -e "make build directory\n"

mkdir -p ./SIRF-SuperBuild_build

echo -e "move build directory\n"

cd ./SIRF-SuperBuild_build

echo -e "cmake SIRF-SuperBuild\n"

cmake ../SIRF-SuperBuild \
-DBUILD_SIRF_contribs:BOOL=OFF \
-DBUILD_TESTING_STIR:BOOL=ON \
-DCMAKE_BUILD_TYPE:STRING="RelWithDebInfo" \
-DCMAKE_INSTALL_PREFIX:STRING="./SIRF-SuperBuild_install" \
-DCUDA_64_BIT_DEVICE_CODE:BOOL=OFF \
-DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE:BOOL=OFF \
-DCUDA_HOST_COMPILATION_CPP:BOOL=OFF \
-DCUDA_PROPAGATE_HOST_FLAGS:BOOL=OFF \
-DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL=OFF \
-DDEVEL_BUILD:BOOL=ON \
-DDISABLE_CUDA:BOOL=ON \
-DDISABLE_MATLAB:BOOL=ON \
-DGadgetron_USE_CUDA:BOOL=OFF \
-DHDF5_USE_CUDA:BOOL=OFF \
-DNiftyPET_PYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
-DNiftyPET_PYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
-DNiftyPET_PYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
-DPYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
-DPYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
-DPYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
-DPYVER:STRING="3" \
-DSIRF_TAG:STRING="master" \
-DSTIR_BUILD_EXECUTABLES:BOOL=ON \
-DSTIR_TAG:STRING="tof_sino_UCL" \
-DSTIR_URL:STRING="https://github.com/NikEfth/STIR" \
-DSWIG_EXECUTABLE:STRING="./SIRF-SuperBuild_install.bin/swig" \
-DUSE_ITK:BOOL=ON \
-DUSE_Nifty_PET:BOOL=OFF \
-DUSE_SYSTEM_ACE:BOOL=OFF \
-DBUILD_TESTING_ITK:BOOL=ON

echo -e "make SIRF-SuperBuild\n"

make $1
