cls
@echo off


echo.
echo. "# Export Start"
echo.
for /f "delims=" %%i in (./path.prop) do set _path=%%i
echo %_path%
rem set str=%str:~0,4%
set _path=%_path:EXPORT_PATH=%
set _path=%_path:~1%
echo %_path%
echo.
rem xcopy "../*" , "%_path%" /E /R /C /Y /M> "%FILEXCOPY_LOG%"

rem if exist %_path%/Huan_JSProject_10 (
rem ) else (
rem  mkdir %_path%/Huan_JSProject_10
rem )
xcopy ".." "%_path%" /e /c /y /i

echo.
echo.
echo.


pause
