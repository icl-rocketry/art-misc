@echo off
cd /d %~dp0
TITLE Moving Repository

:start
set /p current="Enter current repo URL: "
set /p destination="Enter destination repo URL: "
echo Source at %current% selected 
echo Destination at %destination% selected

CHOICE /C YN /M "Continue "
IF %ERRORLEVEL% == 1 (GOTO move)
IF %ERRORLEVEL% == 2 (GOTO start)

:move
git clone --mirror %current% tempdir
cd tempdir
echo Source repo cloned
git tag
git branch -a

git remote rm origin
git remote add origin %destination% 
git push origin --all
git push --tags

echo Repository cloned successfully

CHOICE /C YN /M "Cleanup? "
IF %ERRORLEVEL% == 1 (GOTO cleanup)

:cleanup
cd ..
rmdir /s /q tempdir

echo Cleanup successful

PAUSE

