#!/bin/bash

#Copyright University College London 2020
#Author: Ander Biguri, Institute of Nuclear Medicine, UCL
#Author: Alexander Whitehead, Institute of Nuclear Medicine, UCL
#For internal research only.

if [ $# -ge 3 ]
then
    if [ $3 == "-1" -o $3 == "-b" -o $3 == "--both" ]
    then
        #!!!TOF!!!
        echo -e "tof\n"
        
        if [ $# -ge 2 ]
        then
            if [ $2 == "-c" -o $2 == "--clone" ]
            then
                echo -e "cloning superbuild\n"
                
                if [ -d "./SIRF-SuperBuild" ] 
                then
                    rm -rf "./SIRF-SuperBuild"
                fi
                
                git clone --single-branch --branch STIR_DISABLE_ITK_fix https://github.com/ALEXJAZZ008008/SIRF-SuperBuild.git
                
                echo -e "cleaning build directory\n"
                
                if [ -d "./SIRF-SuperBuild_build" ] 
                then
                    rm -rf "./SIRF-SuperBuild_build"
                fi
                
                if [ -d "./SIRF-SuperBuild_install" ] 
                then
                    rm -rf "./SIRF-SuperBuild_install"
                fi
                
                if [ -d "./SIRF-SuperBuild_install;" ] 
                then
                    rm -rf "./SIRF-SuperBuild_install;"
                fi
            else
                if [ $1 == "-r" -o $1 == "--rm" ]
                then
                    echo -e "cleaning build directory\n"
                    
                    if [ -d "./SIRF-SuperBuild_build" ] 
                    then
                        rm -rf "./SIRF-SuperBuild_build"
                    fi
                    
                    if [ -d "./SIRF-SuperBuild_install" ] 
                    then
                        rm -rf "./SIRF-SuperBuild_install"
                    fi
                    
                    if [ -d "./SIRF-SuperBuild_install;" ] 
                    then
                        rm -rf "./SIRF-SuperBuild_install;"
                    fi
                fi
            fi
        fi

        echo -e "make build directory\n"

        if [ ! -d "./SIRF-SuperBuild_build" ] 
        then
            mkdir -p "./SIRF-SuperBuild_build"
        fi

        echo -e "move build directory\n"

        cd "./SIRF-SuperBuild_build"

        echo -e "cmake SIRF-SuperBuild\n"

        #TODO: remove absolute paths
        cmake ../SIRF-SuperBuild \
        -DBUILD_NIFTYREG:BOOL=OFF \
        -DBUILD_SIRF_Registration:BOOL=OFF \
        -DBUILD_SIRF_Contribs:BOOL=OFF \
        -DBUILD_SPM:BOOL=OFF \
        -DBUILD_TESTING_Gadgetron:BOOL=OFF \
        -DBUILD_TESTING_ISMRMRD:BOOL=OFF \
        -DBUILD_TESTING_SIRF:BOOL=OFF \
        -DBUILD_TESTING_STIR:BOOL=OFF \
        -DCMAKE_BUILD_TYPE:STRING="RelWithDebInfo" \
        -DCMAKE_INSTALL_PREFIX:STRING="/home/alex/Documents/SIRF-SuperBuild_install/" \
        -DCUDA_64_BIT_DEVICE_CODE:BOOL=OFF \
        -DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE:BOOL=OFF \
        -DCUDA_HOST_COMPILATION_CPP:BOOL=OFF \
        -DCUDA_PROPAGATE_HOST_FLAGS:BOOL=OFF \
        -DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL=OFF \
        -DDEVEL_BUILD:BOOL=ON \
        -DDISABLE_CUDA:BOOL=ON \
        -DDISABLE_Matlab:BOOL=ON \
        -DGadgetron_USE_CUDA:BOOL=OFF \
        -DHDF5_USE_CUDA:BOOL=OFF \
        -DNiftyPET_PYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
        -DNiftyPET_PYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
        -DNiftyPET_PYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
        -DPYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
        -DPYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
        -DPYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
        -DSIRF_TAG:STRING="origin/tof_stir_030100" \
        -DSIRF_URL:STRING="https://github.com/ALEXJAZZ008008/SIRF" \
        -DSTIR_BUILD_EXECUTABLES:BOOL=ON \
        -DSTIR_TAG:STRING="origin/tof_stir_030100" \
        -DSTIR_URL:STRING="https://github.com/ALEXJAZZ008008/STIR" \
        -DSWIG_EXECUTABLE:STRING="/home/alex/Documents/SIRF-SuperBuild_install/bin/swig" \
        -DUSE_ITK:BOOL=ON \
        -DUSE_Nifty_PET:BOOL=OFF \
        -DUSE_SYSTEM_ACE:BOOL=OFF \
        -DBUILD_TESTING_ITK:BOOL=OFF \
        -DITK_SHARED_LIBS:BOOL=OFF
        
        cd ".."
    fi
    
    if [ $3 == "-2" -o $3 == "-b" -o $3 == "--both" ]
    then
        #!!!REG!!!
        echo -e "reg\n"
        
        echo -e "make new directory\n"

        if [ ! -d "./new_SIRF-SuperBuild" ] 
        then
            mkdir -p "./new_SIRF-SuperBuild"
        fi
        
        cd "./new_SIRF-SuperBuild"
        
        if [ $# -ge 2 ]
        then
            if [ $2 == "-c" -o $2 == "--clone" ]
            then            
                echo -e "cleaning build directory\n"
                
                if [ -d "./SIRF-SuperBuild_build" ] 
                then
                    rm -rf "./SIRF-SuperBuild_build"
                fi
                
                if [ -d "./SIRF-SuperBuild_install" ] 
                then
                    rm -rf "./SIRF-SuperBuild_install"
                fi
                
                if [ -d "./SIRF-SuperBuild_install;" ] 
                then
                    rm -rf "./SIRF-SuperBuild_install;"
                fi
            else
                if [ $1 == "-r" -o $1 == "--rm" ]
                then
                    echo -e "cleaning build directory\n"
                    
                    if [ -d "./SIRF-SuperBuild_build" ] 
                    then
                        rm -rf "./SIRF-SuperBuild_build"
                    fi
                    
                    if [ -d "./SIRF-SuperBuild_install" ] 
                    then
                        rm -rf "./SIRF-SuperBuild_install"
                    fi
                    
                    if [ -d "./SIRF-SuperBuild_install;" ] 
                    then
                        rm -rf "./SIRF-SuperBuild_install;"
                    fi
                fi
            fi
        fi

        echo -e "make build directory\n"

        if [ ! -d "./SIRF-SuperBuild_build" ] 
        then
            mkdir -p "./SIRF-SuperBuild_build"
        fi

        echo -e "move build directory\n"

        cd "./SIRF-SuperBuild_build"

        echo -e "cmake SIRF-SuperBuild\n"

        #TODO: remove absolute paths
        cmake ../../SIRF-SuperBuild \
        -DBUILD_NIFTYREG:BOOL=ON \
        -DBUILD_SIRF_Registration:BOOL=ON \
        -DBUILD_SIRF_Contribs:BOOL=OFF \
        -DBUILD_SPM:BOOL=ON \
        -DBUILD_TESTING_Gadgetron:BOOL=OFF \
        -DBUILD_TESTING_ISMRMRD:BOOL=OFF \
        -DBUILD_TESTING_SIRF:BOOL=OFF \
        -DBUILD_TESTING_STIR:BOOL=OFF \
        -DCMAKE_BUILD_TYPE:STRING="RelWithDebInfo" \
        -DCMAKE_INSTALL_PREFIX:STRING="/home/alex/Documents/new_SIRF-SuperBuild/SIRF-SuperBuild_install/" \
        -DCUDA_64_BIT_DEVICE_CODE:BOOL=OFF \
        -DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE:BOOL=OFF \
        -DCUDA_HOST_COMPILATION_CPP:BOOL=OFF \
        -DCUDA_PROPAGATE_HOST_FLAGS:BOOL=OFF \
        -DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL=OFF \
        -DDEVEL_BUILD:BOOL=ON \
        -DDISABLE_CUDA:BOOL=ON \
        -DDISABLE_Matlab:BOOL=ON \
        -DGadgetron_USE_CUDA:BOOL=OFF \
        -DHDF5_USE_CUDA:BOOL=OFF \
        -DNiftyPET_PYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
        -DNiftyPET_PYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
        -DNiftyPET_PYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
        -DPYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
        -DPYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
        -DPYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
        -DSIRF_TAG:STRING="origin/master" \
        -DSIRF_URL:STRING="https://github.com/SyneRBI/SIRF" \
        -DSTIR_BUILD_EXECUTABLES:BOOL=ON \
        -DSTIR_TAG:STRING="origin/master" \
        -DSTIR_URL:STRING="https://github.com/UCL/STIR" \
        -DSWIG_EXECUTABLE:STRING="/home/alex/Documents/new_SIRF-SuperBuild/SIRF-SuperBuild_install/bin/swig" \
        -DUSE_ITK:BOOL=ON \
        -DUSE_Nifty_PET:BOOL=OFF \
        -DUSE_SYSTEM_ACE:BOOL=OFF \
        -DBUILD_TESTING_ITK:BOOL=OFF \
        -DITK_SHARED_LIBS:BOOL=OFF
        
        cd "../.."
    fi
    
    if [ $3 == "-1" -o $3 == "-b" -o $3 == "--both" ]
    then
        #!!!TOF!!!
        cd "./SIRF-SuperBuild_build"
        
        echo -e "make SIRF-SuperBuild\n"

        make -j$1
        
        cd ".."
    fi
    
    if [ $3 == "-2" -o $3 == "-b" -o $3 == "--both" ]
    then
        cd "./new_SIRF-SuperBuild/SIRF-SuperBuild_build"
        
        #!!!REG!!!
        echo -e "make new_SIRF-SuperBuild\n"

        make -j$1
        
        cd "../.."
    fi
else
    #!!!TOF REG!!!
    echo -e "tof reg\n"
    
    if [ $# -ge 2 ]
    then
        if [ $2 == "-c" -o $2 == "--clone" ]
        then
            echo -e "cloning superbuild\n"
            
            if [ -d "./SIRF-SuperBuild" ] 
            then
                rm -rf "./SIRF-SuperBuild"
            fi
            
            git clone --single-branch --branch STIR_DISABLE_ITK_fix https://github.com/ALEXJAZZ008008/SIRF-SuperBuild.git
            
            echo -e "cleaning build directory\n"
            
            if [ -d "./SIRF-SuperBuild_build" ] 
            then
                rm -rf "./SIRF-SuperBuild_build"
            fi
            
            if [ -d "./SIRF-SuperBuild_install" ] 
            then
                rm -rf "./SIRF-SuperBuild_install"
            fi
            
            if [ -d "./SIRF-SuperBuild_install;" ] 
            then
                rm -rf "./SIRF-SuperBuild_install;"
            fi
        else
            if [ $1 == "-r" -o $1 == "--rm" ]
            then
                echo -e "cleaning build directory\n"
                
                if [ -d "./SIRF-SuperBuild_build" ] 
                then
                    rm -rf "./SIRF-SuperBuild_build"
                fi
                
                if [ -d "./SIRF-SuperBuild_install" ] 
                then
                    rm -rf "./SIRF-SuperBuild_install"
                fi
                
                if [ -d "./SIRF-SuperBuild_install;" ] 
                then
                    rm -rf "./SIRF-SuperBuild_install;"
                fi
            fi
        fi
    fi

    echo -e "make build directory\n"

    if [ ! -d "./SIRF-SuperBuild_build" ] 
    then
        mkdir -p "./SIRF-SuperBuild_build"
    fi

    echo -e "move build directory\n"

    cd "./SIRF-SuperBuild_build"

    echo -e "cmake SIRF-SuperBuild\n"

    #TODO: remove absolute paths
    cmake ../SIRF-SuperBuild \
    -DBUILD_NIFTYREG:BOOL=ON \
    -DBUILD_SIRF_Registration:BOOL=ON \
    -DBUILD_SIRF_Contribs:BOOL=OFF \
    -DBUILD_SPM:BOOL=ON \
    -DBUILD_TESTING_Gadgetron:BOOL=OFF \
    -DBUILD_TESTING_ISMRMRD:BOOL=OFF \
    -DBUILD_TESTING_SIRF:BOOL=OFF \
    -DBUILD_TESTING_STIR:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING="RelWithDebInfo" \
    -DCMAKE_INSTALL_PREFIX:STRING="/home/alex/Documents/SIRF-SuperBuild_install/" \
    -DCUDA_64_BIT_DEVICE_CODE:BOOL=OFF \
    -DCUDA_ATTACH_VS_BUILD_RULE_TO_CUDA_FILE:BOOL=OFF \
    -DCUDA_HOST_COMPILATION_CPP:BOOL=OFF \
    -DCUDA_PROPAGATE_HOST_FLAGS:BOOL=OFF \
    -DCUDA_USE_STATIC_CUDA_RUNTIME:BOOL=OFF \
    -DDEVEL_BUILD:BOOL=ON \
    -DDISABLE_CUDA:BOOL=ON \
    -DDISABLE_Matlab:BOOL=ON \
    -DGadgetron_USE_CUDA:BOOL=OFF \
    -DHDF5_USE_CUDA:BOOL=OFF \
    -DNiftyPET_PYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
    -DNiftyPET_PYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
    -DNiftyPET_PYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
    -DPYTHON_EXECUTABLE:STRING="/usr/bin/python3.6m" \
    -DPYTHON_INCLUDE_DIR:STRING="/usr/include/python3.6m/" \
    -DPYTHON_LIBRARY:STRING="/usr/lib/x86_64-linux-gnu/libpython3.6m.so" \
    -DSIRF_TAG:STRING="origin/master" \
    -DSIRF_URL:STRING="https://github.com/SyneRBI/SIRF" \
    -DSTIR_BUILD_EXECUTABLES:BOOL=ON \
    -DSTIR_TAG:STRING="origin/tof_sino_UCL" \
    -DSTIR_URL:STRING="https://github.com/NikEfth/STIR" \
    -DSWIG_EXECUTABLE:STRING="/home/alex/Documents/SIRF-SuperBuild_install/bin/swig" \
    -DUSE_ITK:BOOL=ON \
    -DUSE_Nifty_PET:BOOL=OFF \
    -DUSE_SYSTEM_ACE:BOOL=OFF \
    -DBUILD_TESTING_ITK:BOOL=OFF \
    -DITK_SHARED_LIBS:BOOL=OFF

    echo -e "make SIRF-SuperBuild\n"

    make -j$1
    
    cd ".."
fi
