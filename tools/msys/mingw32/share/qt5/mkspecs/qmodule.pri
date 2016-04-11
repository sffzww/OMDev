QT_BUILD_PARTS += libs tools examples
QT_QCONFIG_PATH = 

host_build {
    QT_CPU_FEATURES.i386 = 
} else {
    QT_CPU_FEATURES.i386 = 
}
QT_COORD_TYPE += double
#Qt for Windows CE c-runtime deployment
QT_CE_C_RUNTIME = no
CONFIG += debug compile_examples sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 largefile
QT_COMPILER_STDCXX = 199711
QMAKE_QT_VERSION_OVERRIDE = 5
QMAKE_CFLAGS_FONTCONFIG =
QMAKE_LIBS_FONTCONFIG   = -lfreetype -lfontconfig
INCLUDEPATH    += F:/OMDev/tools/msys/mingw32/include/dbus-1.0 F:/OMDev/tools/msys/mingw32/lib/dbus-1.0/include F:/OMDev/tools/msys/mingw32/include/libxml2 F:/OMDev/tools/msys/mingw32/include/freetype2 F:/OMDev/tools/msys/mingw32/include F:/OMDev/tools/msys/mingw32/include/libpng16 F:/OMDev/tools/msys/mingw32/include/harfbuzz F:/OMDev/tools/msys/mingw32/include/glib-2.0 F:/OMDev/tools/msys/mingw32/lib/glib-2.0/include F:/OMDev/tools/msys/mingw32/include F:/OMDev/tools/msys/mingw32/include/mariadb
sql-plugins    += mysql odbc psql sqlite ibase
styles         += windows fusion windowsxp windowsvista
