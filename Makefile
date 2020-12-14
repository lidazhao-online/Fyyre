# This Makefile is compatible with mingw32-make and nmake.
# To build msvc libs: nmake msvc
# To build mingw libs: mingw32-make mingw

all:
	@echo Specify 'msvc' or 'mingw' target.

msvc:
	lib /def:ntdll86.def /out:ntdll86.lib /machine:x86
	lib /def:ntdll64.def /out:ntdll64.lib /machine:x64
	del /q ntdll86.exp
	del /q ntdll64.exp

mingw:
	dlltool -d ntdll86.def -l libntdll86.a -k
	dlltool -d ntdll64.def -l libntdll64.a
