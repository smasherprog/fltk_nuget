SET v1=%~1
SET v2=%~2
SET v3=%~3
SET v4=%~4

if exist "C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe" (
	set msbuild="C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe"
)
if exist "C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe" (
	set msbuild="C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe"
)

call cd "%v1%"
call cmake -G "%v2%" -D OPTION_BUILD_EXAMPLES=FALSE "%v3%/%v1%/"
for %%g in (src\*.vcxproj) do call powershell -ExecutionPolicy Bypass "%v3%/updatedebug.ps1 '%v3%/%v1%/%%g'"
for %%g in (jpeg\*.vcxproj) do call powershell -ExecutionPolicy Bypass "%v3%/updatedebug.ps1 '%v3%/%v1%/%%g'"
for %%g in (png\*.vcxproj) do call powershell -ExecutionPolicy Bypass "%v3%/updatedebug.ps1 '%v3%/%v1%/%%g'"
for %%g in (zlib\*.vcxproj) do call powershell -ExecutionPolicy Bypass "%v3%/updatedebug.ps1 '%v3%/%v1%/%%g'"
call cd ..
call %msbuild% %v3%/%v1%/fltk.sln /t:fltk;fltk_forms;fltk_gl;fltk_images;fltk_jpeg;fltk_png;fltk_z %v4%
exit