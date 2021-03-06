SET var=%cd%
for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%
set infilename=%filename:-source=%

if exist "C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe" (
	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-32-VS2015\" /E /H /K /y
	call xcopy "%var%\%filename%\%infilename%" "%var%\fltk-src-64-VS2015\" /E /H /K /y

	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Debug/md/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebugDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Debug/mt/ /p:Configuration=Debug /p:Platform=Win32 /p:PlatformToolset=v140 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebug""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Release/md/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v140 /p:DebugSymbols=false /p:DebugType=none" "MultiThreadedDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-32-VS2015" "Visual Studio 14 2015" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/Win32/Release/mt/ /p:Configuration=Release /p:Platform=Win32 /p:PlatformToolset=v140 /p:DebugSymbols=false /p:DebugType=none" "MultiThreaded""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Debug/md/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v140 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebugDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Debug/mt/ /p:Configuration=Debug /p:Platform=x64 /p:PlatformToolset=v140 /p:DebugSymbols=true /p:DebugType=pdbonly" "MultiThreadedDebug""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Release/md/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v140 /p:DebugSymbols=false /p:DebugType=none" "MultiThreadedDLL""
	start /wait cmd.exe /k "build_each.bat "fltk-src-64-VS2015" "Visual Studio 14 2015 Win64" "%var%" "/p:OutDir=../../fltk/lib/native/v140/windesktop/msvcstl/x64/Release/mt/ /p:Configuration=Release /p:Platform=x64 /p:PlatformToolset=v140 /p:DebugSymbols=false /p:DebugType=none" "MultiThreaded""
	call rd /s /q "fltk-src-32-VS2015"
	call rd /s /q "fltk-src-64-VS2015"
)
exit