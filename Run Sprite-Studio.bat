@echo off
setlocal
cd /d "%~dp0"

if not exist "%~dp0index.html" goto missing_app

where py >nul 2>nul
if not errorlevel 1 (
  py -3 --version >nul 2>nul
  if not errorlevel 1 goto use_py
)

where python >nul 2>nul
if errorlevel 1 goto missing_python
python --version >nul 2>nul
if errorlevel 1 goto missing_python
goto use_python

:use_py
start "" "http://127.0.0.1:8765"
py -3 -m http.server 8765 --bind 127.0.0.1
goto done

:use_python
start "" "http://127.0.0.1:8765"
python -m http.server 8765 --bind 127.0.0.1
goto done

:missing_app
echo Could not find index.html beside this launcher.
echo Keep Run Sprite-Studio.bat in the root of the Sprite-Studio folder.
pause
goto done

:missing_python
echo Sprite-Studio needs Python 3 to serve its included sample files.
echo Install Python 3, then launch this file again.
pause

:done
endlocal
