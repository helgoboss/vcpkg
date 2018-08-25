if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Darwin")
    set(CMAKE_CROSSCOMPILING OFF CACHE BOOL "")
endif()
set(CMAKE_SYSTEM_NAME Darwin CACHE STRING "")

# The following lines are supposed to produce the correct "helgoboss" build configuration for all packages
# that vcpkg builds directly via CMake. I will derive the correct "helgoboss" build configuration from the way I used
# to compile Boost in the past, so the comments will contain b2 command line options. 
#
# I used the following b2 command line to build it:
#
#         ./b2 -a toolset=clang macosx-version-min=10.7 threading=multi link=static runtime-link=static linkflags="-stdlib=libc++"
#              cxxflags="-arch i386 -arch x86_64 -std=c++1y -stdlib=libc++ -isysroot /Developer/SDKs/MacOSX10.7.sdk" 
#
# Please note that the following lines don't affect Boost builds because vcpkg builds Boost via b2.
# In order to use "helgoboss" build configuration also for Boost, modifications in the following files might be necessary:
#
# - ports/boost-modular-build-helper/CMakeLists.txt
# - ports/boost-modular-build-helper/boost-modular-build.cmake

# toolset=clang
# Default

# macosx-version-min=10.7
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.7" CACHE STRING "")

# threading=multi
# Default

# link=static
# Set via VCPKG_LIBRARY_LINKAGE in triplet

# runtime-link=static
# Set via VCPKG_CRT_LINKAGE in triplet

# cxxflags="-arch i386 -arch x86_64 ...
set(CMAKE_OSX_ARCHITECTURES "i386;x86_64" CACHE STRING "")

# ... -std=c++1y -stdlib=libc++ ...
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -stdlib=libc++" CACHE STRING "")

# ... isysroot /Developer/SDKs/MacOSX10.7.sdk" ....
set(CMAKE_OSX_SYSROOT "/Developer/SDKs/MacOSX10.7.sdk" CACHE STRING "")

# linkflags="-stdlib=libc++"
# Seemingly redundant