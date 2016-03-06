set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%
set headeradd=define Fl_H #if _WIN32 #if defined _DLL #pragma comment(lib, "md/fltk") #pragma comment(lib, "md/fltk_forms") #pragma comment(lib, "md/fltk_gl") #pragma comment(lib, "md/fltk_images") #pragma comment(lib, "md/fltk_jpeg") #pragma comment(lib, "md/fltk_png") #pragma comment(lib, "md/fltk_z") #elif defined _MT #pragma comment(lib, "mt/fltk") #pragma comment(lib, "mt/fltk_forms") #pragma comment(lib, "mt/fltk_gl") #pragma comment(lib, "mt/fltk_images") #pragma comment(lib, "mt/fltk_jpeg") #pragma comment(lib, "mt/fltk_png") #pragma comment(lib, "mt/fltk_z") #endif #endif


for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%
start /wait cmd.exe /k "cleanbuild.bat %filename%"

call %SEVENZIP% x "%var%/%foundfile%.gz" -o"%var%\%filename%"
set infilename=%filename:-source=%

call powershell -Command "(gc %filename%/%infilename%/FL/FL.h) -replace 'define Fl_H', '%headeradd%' | Out-File '%filename%/%infilename%"/FL/FL.h'"
call xcopy "%var%\%filename%\%infilename%\FL" fltk\build\native\include\FL\ /E /H /K /y
call xcopy "%var%\%filename%\%infilename%\GL" fltk\build\native\include\GL\ /E /H /K /y

if exist "C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe" (

	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-64-VS2013\" /E /H /K /y
	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-32-VS2013\" /E /H /K /y

	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Debug/md/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Debug/mt/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Release/md/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Release/mt/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Debug/md/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Debug/mt/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Release/md/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Release/mt/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v120 /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none""
)
if exist "C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe" (
	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-32-VS2015\" /E /H /K /y
	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-64-VS2015\" /E /H /K /y

	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Debug/md/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Debug/mt/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Release/md/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Release/mt/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Debug/md/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebugDLL /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Debug/mt/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDebug /p:DebugSymbols=true /p:DebugType=pdbonly""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Release/md/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreadedDLL /p:DebugSymbols=false /p:DebugType=none""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Release/mt/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v140 /p:RuntimeLibrary=MultiThreaded /p:DebugSymbols=false /p:DebugType=none""
)

start /wait cmd.exe /k "cleanbuild.bat %filename%"