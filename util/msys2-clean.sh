#!/usr/bin/bash

# script to cleanup msys2 installation
# adrian.pop@liu.se

# remove Qt5 examples
rm -vrf /mingw32/share/qt5/examples
rm -vrf /mingw64/share/qt5/examples
# remove all Qt5 debug .dll files
for dll in `pacman -Ql mingw-w64-{i686,x86_64}-qt5 | grep "d[.]dll" | cut -f2 -d" "` ; do
  f=`echo $dll | sed s/d[.]dll/.dll/`
  test -f $f && rm -vf $dll
done
# remove all Qt5 debug .a files
for dll in `pacman -Ql mingw-w64-{i686,x86_64}-qt5 | grep "d[.]a" | cut -f2 -d" "` ; do
  f=`echo $dll | sed s/d[.]a/.a/`
  test -f $f && rm -vf $dll
done

# comment out 
# _populate_Core_target_properties(DEBUG "Qt5Cored.dll" "libQt5Cored.dll.a" )
# in Qt5CoreConfig.cmake
sed -i.bak s/'_populate_Core_target_properties(DEBUG "Qt5Cored.dll"'/'# _populate_Core_target_properties(DEBUG "Qt5Cored.dll"'/g /mingw32/lib/cmake/Qt5Core/Qt5CoreConfig.cmake
sed -i.bak s/'_populate_Core_target_properties(DEBUG "Qt5Cored.dll"'/'# _populate_Core_target_properties(DEBUG "Qt5Cored.dll"'/g /mingw64/lib/cmake/Qt5Core/Qt5CoreConfig.cmake

