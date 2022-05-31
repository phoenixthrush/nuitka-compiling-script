@echo off

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")

call :colorEcho 0B "[Info] Tool made by 'Phoenixthrush UwU'" && echo. && echo.
call :colorEcho 0C "[Info] deleting old files if they exists" && echo.
del main.exe /q >nul 2>&1
rmdir main.build /S /Q >nul 2>&1
rmdir main.dist /S /Q >nul 2>&1
rmdir main.onefile-build /S /Q >nul 2>&1

call :colorEcho 0C "[Info] compiling executable"
call :colorEcho 0F " (could take a while + no progress bar)" && echo.
python -m nuitka --onefile --enable-plugin=numpy --remove-output --windows-disable-console --windows-icon-from-ico=icon.ico --windows-company-name="Phoenixthrush UwU" --windows-file-version=1 --low-memory --quiet main.py
REM  >nul 2>&1

call :colorEcho 0C "[Info] cleaning up" && echo.
rmdir main.build /S /Q >nul 2>&1
rmdir main.dist /S /Q >nul 2>&1
rmdir main.onefile-build /S /Q >nul 2>&1

echo.
call :colorEcho 0A "[Info] finished!" && echo.
call :colorEcho 0A "[Info] Press enter to exit!" && echo.
pause >nul
exit

:colorEcho
@echo off
< nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1