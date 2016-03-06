copy fltk.targets fltk\build\native\
copy fltk.nuspec fltk\
nuget pack fltk\fltk.nuspec
for /r . %%g in (*.nupkg) do nuget push %%g 