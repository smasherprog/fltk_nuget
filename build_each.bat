SET v1=%~1
SET v2=%~2

if exist "C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe" (
	set msbuild="C:/Program Files (x86)/MSBuild/12.0/Bin/msbuild.exe"
)
if exist "C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe" (
	set msbuild="C:/Program Files (x86)/MSBuild/14.0/Bin/msbuild.exe"
)

call %msbuild% %cd%/%v1%/fltk.sln /t:fltk;fltk_forms;fltk_gl;fltk_images;fltk_jpeg;fltk_png;fltk_z %v2%
exit