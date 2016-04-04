OMDev=OpenModelica Development Environment
-------------------------------------------
Adrian.Pop@liu.se, 2012-02-15, last update 2016-03-11

In Subversion here:
https://openmodelica.org/svn/OpenModelicaExternal/trunk/tools/windows/OMDev

OMDev=a set of tools packaged togheter so no
      installation is necessary and everything 
      works as expected.
This is a specific release based on msys2/mingw32/mingw64


Quick course on msys2
---------------------
Adrian.Pop@liu.se
2016-03-11

More information here:
http://sourceforge.net/p/msys2/wiki/MSYS2%20installation/

Install msys2 from:
 http://msys2.github.io/
into OMDev\tools\msys
start the msys2 shell and sync the local package database, and update the msys2 system:
 > pacman -Syuu
 RESTART the msys2 shell if you are told to do so!
do a full system upgrade write:
 > pacman -Syuu
install some usual packages:
 > pacman -S zip unzip tar make diffutils patch
install needed configuration and build tools:
 > pacman -S autoconf automake m4 pkg-config libtool
install mingw64 and mingw32:
 > pacman -S mingw-w64-x86_64-toolchain mingw-w64-i686-toolchain
install opencl headers
 > pacman -S mingw32/mingw-w64-i686-opencl-headers mingw64/mingw-w64-x86_64-opencl-headers
install wget
 > pacman -S wget
install lapack: openblas
 > pacman -S mingw32/mingw-w64-i686-openblas mingw64/mingw-w64-x86_64-openblas
install bison needed for lpsolve compilation
 > pacman -S bison
install binutils for -lbfd and -liberty
 > pacman -S mingw-w64-{i686,x86_64}-{gcc,binutils}

for modelica3d
install dbus
 > pacman -S mingw32/mingw-w64-i686-dbus mingw32/mingw-w64-i686-dbus-glib
 > pacman -S mingw64/mingw-w64-x86_64-dbus mingw64/mingw-w64-x86_64-dbus-glib
install gtk2 
 > pacman -S mingw32/mingw-w64-i686-gtk2 mingw64/mingw-w64-x86_64-gtk2
install OSG open scene graph
 > pacman -S mingw32/mingw-w64-i686-OpenSceneGraph mingw64/mingw-w64-x86_64-OpenSceneGraph
install cmake mingw32 and mingw64
 > pacman -S mingw32/mingw-w64-i686-cmake mingw64/mingw-w64-x86_64-cmake
 > pacman -S mingw32/mingw-w64-i686-extra-cmake-modules mingw64/mingw-w64-x86_64-extra-cmake-modules
install qt-creator
 > pacman -S mingw32/mingw-w64-i686-qt-creator mingw64/mingw-w64-x86_64-qt-creator

To make things move fast in msys2 one has to generate the group and passwd files on the host:
> mkpasswd -l -c > /etc/passwd
> mkgroup -l -c > /etc/group
In /etc/nsswitch.conf one needs to change to:
passwd: files #db
group: files #db

if you move the OMDev directory around then you need to path the qt files using:
> cd $OMDEV/tools/msys/mingw64/bin
> qtbinpatcher --nobackup
> cd $OMDEV/tools/msys/mingw32/bin
> qtbinpatcher --nobackup

see all installed packages
> pacman -Qet
list the files in a package
> pacman -Ql mingw-w64-i686-openblas
find which package a file belongs to:
> pkgfile file


To get the debug DLLs for qt5 and the qt5 examples reinstall the qt5 packages:
See which are the installed qt packages:
 > pacman -Ss qt5 | grep installed
   mingw32/mingw-w64-i686-qt5 5.5.1-4 (mingw-w64-i686-qt mingw-w64-i686-qt5) [installed]
   mingw64/mingw-w64-x86_64-qt5 5.5.1-4 (mingw-w64-x86_64-qt mingw-w64-x86_64-qt5) [installed]
 > pacman -S mingw-w64-i686-qt5 5.5.1-4 mingw-w64-x86_64-qt5 5.5.1-4
To clean the examples and the debug dlls do:
 > $OMDEV/util/msys2-clean.sh
To clear the pacman cache:
 > pacman -Scc
 
if you have issues with pacman you can reinit it via:
 > pacman-key --init
 > pacman-key --populate

if you get things like:
0 [main] make 15324 child_info_fork::abort: 
X:\msys\usr\bin\msys-unistring-2.dll: 
Loaded to different address: parent(0x840000) != child(0x440000)
exit the msys2 shell and run autorebase.bat


