set infilename=%1:-source=%

for /r . %%g in (*.nupkg) do del %%g 	
call del %1.tar
call rd /s /q "%infilename%"
call rd /s /q "%1"
call rd /s /q "fltk-src-32-VS2013"
call rd /s /q "fltk-src-64-VS2013"
call rd /s /q "fltk-src-32-VS2015"
call rd /s /q "fltk-src-64-VS2015"
exit