@echo off
REM ==============================================================================
REM ORBIT GPS — One-Click Windows GitHub Push Script
REM ==============================================================================
setlocal EnableDelayedExpansion

echo ==============================================================================
echo   ORBIT GPS Tracker -- Windows GitHub Deployment Script
echo ==============================================================================
echo.

set REPO_URL=%1

if "%REPO_URL%"=="" (
    set /p REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/simeer2007/ORBIT-GPS-Tracker.git): "
)

if "%REPO_URL%"=="" (
    echo [ERROR] Repository URL is required!
    pause
    exit /b 1
)

echo.
echo [1/5] Staging all files including firmware, backend, frontend, docs and video...
git add .

echo.
echo [2/5] Creating Git commit...
git commit -m "feat: complete ORBIT GPS IoT tracker with ESP32 firmware, Flask backend, live tracking dashboard, and demo video"

echo.
echo [3/5] Setting main branch...
git branch -M main

echo.
echo [4/5] Setting up remote origin (%REPO_URL%)...
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo.
echo [5/5] Pushing to GitHub (origin/main)...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==============================================================================
    echo  SUCCESS: Your repository has been pushed to GitHub!
    echo  URL: %REPO_URL%
    echo  Demo Video is committed in docs/assets/orbit-tracker-demo.mp4
    echo  Animated Preview is embedded in README.md
    echo ==============================================================================
) else (
    echo.
    echo [ERROR] Push failed. Make sure:
    echo   1. The repository exists on GitHub
    echo   2. You have permission or Personal Access Token (PAT)
    echo   3. Or authenticate via GitHub CLI: gh auth login
)

pause
