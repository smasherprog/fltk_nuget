set SEVENZIP="C:\Program Files\7-Zip\7z.exe"
set foundfile=""
SET var=%cd%

for %%g in (*.gz) do set foundfile=%%~ng
set filename=%foundfile:.tar=%

call %SEVENZIP% x "%var%/%foundfile%.gz" -o"%var%\%filename%"
set infilename=%filename:-source=%

call xcopy "%var%\%filename%\%infilename%\FL" fltk\build\native\include\FL\ /E /H /K /y
call xcopy "%var%\%filename%\%infilename%\GL" fltk\build\native\include\GL\ /E /H /K /y

start cmd.exe /k "build_v120.bat"
start cmd.exe /k "build_v140.bat"