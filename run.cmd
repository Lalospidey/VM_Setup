@echo off

:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( powershell "Start-Process -FilePath %0 -WorkingDirectory %~dp0 -Verb runas")
exit /b 

:gotPrivileges

powershell -ExecutionPolicy ByPass -NoLogo -File %~dp0\run.ps1 -NoExit -WorkingDirectory %~dp0