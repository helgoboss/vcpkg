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


# To enable C++11/14 support by default for this older SDK we still need to do something
# (otherwise e.g. uwebsockets doesn't compile because it can't find mutex header)

# Add first try this
set(CMAKE_CXX_STANDARD 14 CACHE STRING "")

# If it doesn't work, could try something like that:

# -std=c++1y
# set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++1y" CACHE STRING "")

# -stdlib=libc++
#set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++" CACHE STRING "")

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -stdlib=libc++" CACHE STRING "")