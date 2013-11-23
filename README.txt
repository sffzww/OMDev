OMDev=OpenModelica Development Environment
------------------------------------------
Adrian Pop, adrpo@ida.liu.se, 2012-02-15

In Subversion here:
https://openmodelica.ida.liu.se/svn/OpenModelica/installers/windows/OMDev
user: anonymous
pass: none   <-- write "none" here

NOTE:
  READ MORE ABOUT THE CHANGES IN THE SVN LOG!



OMDev=a set of tools packaged togheter so no
      installation is necessary and everything 
      works as expected.
This is a specific release based on msys/mingw
system/compiler with complete binaries/libs/includes
for antlr, mico, rml.

This package includes MINGW compiled binaries of:
antlr -> version 2.7.7  
mico  -> version 2.3.13
msys  -> version 1.0.1
mingw -> version gcc 4.4.0
rml   -> version from Subversion: svn co https://openmodelica.org/svn/MetaModelica/trunk
mlton -> version MLton 20051202 (build Fri Dec 02 11:40:25 2005 on unknown)

MINGW was installed with:
http://prdownloads.sf.net/mingw/MinGW-5.1.4.exe?download

MSYS was installed with: MSYS-1.0.10.exe
http://www.mingw.org/download.shtml

MLton was installed from:
http://www.mlton.org

Look into doc/snapshot-of-mingw+msys-installed-files.txt
for more info of what I used.


OMDev - directory structure looks like this:
============================================
-build
  + all 3rd party libraries needed to build OpenModelica on Windows
  + all releases of clients build for OpenModelica release on windows
-bin
  +antlr - the antlr.jar
  +mico  - the idl compiler + all the mico tools compiled with MSVC
-include
  +antlr           - the general antlr includes
  +mico-msys-mingw - the mingw specific includes
-lib
  +antlr-msys-migw  - the mingw specific antlr library
  +antlr-win32-msvc - the MSVC specific antlr library (linked with /MT or /MTd)
   - md-mdd         - the MSVC specific antlr library (linked with /MD or /MDd)
  +mico-msys-mingw  - the mingw specific mico library
  +mico-win32-msvc  - the MSVC specific mico library
-tools
  +msys   - little unix environment MSYS 1.0
  +mingw  - the mingw compiler latest candidate release
  +rml    - the latest RML for mingw
   - bin            - rml/rmlc + rml sml heap + heap loader.
   - include/plain  - include files
   - lib/plain      - libraries compiled for mingw
-utilities 
  +all the other needed stuf, now empty
-compile-here
  +a placeholder where to compile mingw libraries if you need more of them
-saved-hacked-files
 + contains a hacked configure to use with msys
 + contains the path settings for the configure
 + don't use it, is just for creating the first 
   mingw makefiles, which I edited more after.

