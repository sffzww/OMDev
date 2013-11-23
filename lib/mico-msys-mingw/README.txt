
In ./static directory you have the static libraries.

Edit your omc_release/Makefile and 
Add /static to the -L.../mico-msys-mingw like this:
-L.../mico-msys-mingw/static
to make a static omc.exe non dependent on 
mico<version>.dll
Maybe it would be a good idea as other MSVC based tools
are dependent on MSCV compiled mico2311.dll which is
incompatible with MINGW compiled mico2311.dll


MICO 2.3.13 compilation on MINGW
--------------------------------
- downloaded the mico2.3.13.zip, unpaked it
- I applied the patch present here in compilation-needed-files
- I hacked the config.status script to make socket argument an int
- runned config.status to regenerate the Makefiles
- hacked compilation-needed-files/os-math.h, look for "adrpo"
- compiled

Adrian Pop, 
adrpo@ida.liu.se, 
2008-10-02


