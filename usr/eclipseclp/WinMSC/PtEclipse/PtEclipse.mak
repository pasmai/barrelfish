# Microsoft Developer Studio Generated NMAKE File, Based on PtEclipse.dsp
!IF "$(CFG)" == ""
CFG=PtEclipse - Win32 Debug
!MESSAGE No configuration specified. Defaulting to PtEclipse - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "PtEclipse - Win32 Release" && "$(CFG)" !=\
 "PtEclipse - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "PtEclipse.mak" CFG="PtEclipse - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "PtEclipse - Win32 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "PtEclipse - Win32 Debug" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "PtEclipse - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\PtEclipse.dll"

!ELSE 

ALL : "Eclipse - Win32 Release" "$(OUTDIR)\PtEclipse.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Eclipse - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\bip_pt.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\PtEclipse.dll"
	-@erase "$(OUTDIR)\PtEclipse.exp"
	-@erase "$(OUTDIR)\PtEclipse.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "../../sepia/i386_nt" /I\
 "../../Shm/i386_nt" /I "../../Flexlm/i386_nt" /D "NDEBUG" /D "WIN32" /D\
 "_WINDOWS" /Fp"$(INTDIR)\PtEclipse.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\PtEclipse.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=lm_new_md.obj lmgr_md.lib eclipse.lib msvcrt.lib oldnames.lib\
 kernel32.lib user32.lib netapi32.lib gdi32.lib winspool.lib comdlg32.lib\
 comctl32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib wsock32.lib /nologo /subsystem:windows /dll\
 /incremental:no /pdb:"$(OUTDIR)\PtEclipse.pdb" /machine:I386 /nodefaultlib\
 /def:"..\..\sepia\i386_nt\pteclipse.def" /out:"$(OUTDIR)\PtEclipse.dll"\
 /implib:"$(OUTDIR)\PtEclipse.lib" /libpath:"../Eclipse/Release"\
 /libpath:"../../Flexlm/i386_nt" 
DEF_FILE= \
	"..\..\sepia\i386_nt\pteclipse.def"
LINK32_OBJS= \
	"$(INTDIR)\bip_pt.obj" \
	"..\Eclipse\Release\Eclipse.lib"

"$(OUTDIR)\PtEclipse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

SOURCE=$(InputPath)
PostBuild_Desc=Copying dll to lib
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

$(DS_POSTBUILD_DEP) : "Eclipse - Win32 Release" "$(OUTDIR)\PtEclipse.dll"
   copy Release\PtEclipse.dll ..\..\lib\i386_nt\pteclipse.dll
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ELSEIF  "$(CFG)" == "PtEclipse - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\PtEclipse.dll"

!ELSE 

ALL : "Eclipse - Win32 Debug" "$(OUTDIR)\PtEclipse.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Eclipse - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\bip_pt.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\PtEclipse.dll"
	-@erase "$(OUTDIR)\PtEclipse.exp"
	-@erase "$(OUTDIR)\PtEclipse.ilk"
	-@erase "$(OUTDIR)\PtEclipse.lib"
	-@erase "$(OUTDIR)\PtEclipse.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "../../sepia/i386_nt" /I\
 "../../Shm/i386_nt" /I "../../Flexlm/i386_nt" /D "_DEBUG" /D "WIN32" /D\
 "_WINDOWS" /Fp"$(INTDIR)\PtEclipse.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o NUL /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\PtEclipse.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=lm_new_md.obj lmgr_md.lib eclipse.lib msvcrt.lib oldnames.lib\
 kernel32.lib user32.lib netapi32.lib gdi32.lib winspool.lib comdlg32.lib\
 comctl32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 odbc32.lib odbccp32.lib wsock32.lib /nologo /subsystem:windows /dll\
 /incremental:yes /pdb:"$(OUTDIR)\PtEclipse.pdb" /debug /machine:I386\
 /nodefaultlib /def:"..\..\sepia\i386_nt\pteclipse.def"\
 /out:"$(OUTDIR)\PtEclipse.dll" /implib:"$(OUTDIR)\PtEclipse.lib" /pdbtype:sept\
 /libpath:"../Eclipse/Debug" /libpath:"../../Flexlm/i386_nt" 
DEF_FILE= \
	"..\..\sepia\i386_nt\pteclipse.def"
LINK32_OBJS= \
	"$(INTDIR)\bip_pt.obj" \
	"..\Eclipse\Debug\Eclipse.lib"

"$(OUTDIR)\PtEclipse.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

SOURCE=$(InputPath)
PostBuild_Desc=Copying dll to lib
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

$(DS_POSTBUILD_DEP) : "Eclipse - Win32 Debug" "$(OUTDIR)\PtEclipse.dll"
   copy Debug\PtEclipse.dll ..\..\lib\i386_nt\pteclipse.dll
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"

!ENDIF 


!IF "$(CFG)" == "PtEclipse - Win32 Release" || "$(CFG)" ==\
 "PtEclipse - Win32 Debug"

!IF  "$(CFG)" == "PtEclipse - Win32 Release"

"Eclipse - Win32 Release" : 
   cd "..\Eclipse"
   $(MAKE) /$(MAKEFLAGS) /F .\Eclipse.mak CFG="Eclipse - Win32 Release" 
   cd "..\PtEclipse"

"Eclipse - Win32 ReleaseCLEAN" : 
   cd "..\Eclipse"
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\Eclipse.mak CFG="Eclipse - Win32 Release"\
 RECURSE=1 
   cd "..\PtEclipse"

!ELSEIF  "$(CFG)" == "PtEclipse - Win32 Debug"

"Eclipse - Win32 Debug" : 
   cd "..\Eclipse"
   $(MAKE) /$(MAKEFLAGS) /F .\Eclipse.mak CFG="Eclipse - Win32 Debug" 
   cd "..\PtEclipse"

"Eclipse - Win32 DebugCLEAN" : 
   cd "..\Eclipse"
   $(MAKE) /$(MAKEFLAGS) CLEAN /F .\Eclipse.mak CFG="Eclipse - Win32 Debug"\
 RECURSE=1 
   cd "..\PtEclipse"

!ENDIF 

SOURCE=..\..\sepia\i386_nt\bip_pt.c
DEP_CPP_BIP_P=\
	"..\..\Flexlm\i386_nt\lm_cro.h"\
	"..\..\Flexlm\i386_nt\lmclient.h"\
	"..\..\Flexlm\i386_nt\lmpolicy.h"\
	"..\..\sepia\i386_nt\config.h"\
	"..\..\sepia\i386_nt\dict.h"\
	"..\..\sepia\i386_nt\ec_public.h"\
	"..\..\sepia\i386_nt\embed.h"\
	"..\..\sepia\i386_nt\os_support.h"\
	"..\..\sepia\i386_nt\sepia.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_BIP_P=\
	"..\..\Flexlm\i386_nt\lm_code.h"\
	

"$(INTDIR)\bip_pt.obj" : $(SOURCE) $(DEP_CPP_BIP_P) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

