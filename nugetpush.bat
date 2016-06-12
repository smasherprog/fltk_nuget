call del *.nupkg
copy fltk.targets fltk\build\native\
copy fltk.nuspec fltk\
copy FL.h fltk\build\native\include\FL\
nuget pack fltk\fltk.nuspec
for /r . %%g in (*.nupkg) do nuget push %%g -Timeout 2147483