@echo off
cd /d %~dp0
TITLE Pushing Code

mpfshell -o COM5 -n -c "ls; put datacap.py main.py; mput.*\.mpy; ls; exit"

ECHO Done

PAUSE