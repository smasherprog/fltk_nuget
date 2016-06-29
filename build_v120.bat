SET var=%cd%
for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%
set infilename=%filename:-source=%

if exist "C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe" (

	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-64-VS2013\" /E /H /K /y
	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-32-VS2013\" /E /H /K /y

	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Debug/md/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v120 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebugDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Debug/mt/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v120 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebug""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Release/md/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v120 /p:DebugSymbols=false /p:DebugType=none" "MultiThreadedDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2013" "Visual Studio 12 2013" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/Win32/Release/mt/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v120 /p:DebugSymbols=false /p:DebugType=none" "MultiThreaded""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Debug/md/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v120 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebugDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Debug/mt/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v120 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebug""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Release/md/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v120 /p:DebugSymbols=false /p:DebugType=none" "MultiThreadedDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2013" "Visual Studio 12 2013 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v120/windesktop/msvcstl/x64/Release/mt/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v120 /p:DebugSymbols=false /p:DebugType=none" "MultiThreaded""
	call rd /s /q "fltk-src-32-VS2013"
	call rd /s /q "fltk-src-64-VS2013"
)
exit