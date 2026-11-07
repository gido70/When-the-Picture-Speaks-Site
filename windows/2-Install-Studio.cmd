@echo off
title When the Picture Speaks - Step 2: Install the studio
set "ROOT=C:\WhenThePictureSpeaks"
echo ============================================================
echo   When the Picture Speaks - Step 2 of 3: Install the studio
echo   It will be installed in: %ROOT%\studio
echo   Your old copies in Downloads are NOT touched.
echo ============================================================
where git >nul 2>nul || ( echo Git is not installed. Run step 1 first. & pause & exit /b 1 )
if exist "%ROOT%\studio\.git" (
  echo The studio is already downloaded. Running setup again...
  goto setup
)
if not exist "%ROOT%" mkdir "%ROOT%"
echo.
echo A GitHub sign-in window may open in your browser.
echo Sign in with your GitHub account and click "Authorize".
echo.
git clone -b main https://github.com/gido70/When-the-Picture-Speaks.git "%ROOT%\studio"
if errorlevel 1 ( echo Download failed. Send a screenshot of this window. & pause & exit /b 1 )
:setup
powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%\studio\windows\install.ps1"
echo.
pause
