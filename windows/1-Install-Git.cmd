@echo off
title When the Picture Speaks - Step 1: Install Git
echo ============================================================
echo   When the Picture Speaks - Step 1 of 3: Install Git
echo ============================================================
echo.
where git >nul 2>nul
if not errorlevel 1 (
  echo Git is already installed:
  git --version
  echo.
  echo Nothing to do. You can go to step 2.
  pause
  exit /b 0
)
winget --version >nul 2>nul
if errorlevel 1 (
  echo winget is not available on this PC.
  echo Opening the official Git download page instead...
  start "" https://git-scm.com/download/win
  echo Download "64-bit Git for Windows Setup", run it, and accept the defaults.
  pause
  exit /b 1
)
echo Installing Git for Windows. This takes about one minute...
echo.
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
echo.
echo ============================================================
echo   Done. Close this window.
echo   To check: open a NEW PowerShell window and type:  git --version
echo ============================================================
pause
