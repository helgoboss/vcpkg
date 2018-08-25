if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Darwin")
    set(CMAKE_CROSSCOMPILING OFF CACHE BOOL "")
endif()
set(CMAKE_SYSTEM_NAME Darwin CACHE STRING "")

# Recreate translation properties that I also used when compiling Boost for VST plugin development

# macosx-version-min=10.7
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.7" CACHE STRING "")

# threading=multi
# Probably default

# link=static
# See VCPKG_LIBRARY_LINKAGE in triplet

# runtime-link=static
# See VCPKG_CRT_LINKAGE in triplet

# cxxflags="-arch i386 -arch x86_64"
set(CMAKE_OSX_ARCHITECTURES "i386;x86_64" CACHE STRING "")

# isysroot /Developer/SDKs/MacOSX10.7.sdk
set(CMAKE_OSX_SYSROOT "/Developer/SDKs/MacOSX10.7.sdk" CACHE STRING "")

# linkflags="-stdlib=libc++"
# Probably not necessary