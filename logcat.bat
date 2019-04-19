@echo off
for /f  "tokens=2 delims= " %%i in ('pids.bat') do set pid=%%i
echo %pid%
adb logcat | find  "%pid%"   >d:/putao777.log 
pause