::bat制作抓取Android设备的logcat，并保存以时间命名的txt文件至设备目录 1 @ECHO off
 adb wait-for-device
 ECHO 正在连接设备
 adb logcat -c
 @ECHO off
 ::获取设备名称
 adb pull system/build.prop log\temp.txt
 find "ro.product.name" log\temp.txt >log\1.txt
 for /f "skip=2" %%i in (log\1.txt) do set m=%%i
 set name=%m:~16%
 ::获取设备名称结束
 
 ::新建设备文件夹
 if not exist log\%name% md log\%name%
 del log\temp.txt
 del log\1.txt
 ::新建设备文件夹结束
 
 ::获取当前系统时间
 set day=%date:~0,4%%date:~5,2%%date:~8,2%
 set temp=%time:~0,2%
 if /i %temp% LSS 10 (
 set hour=0%time:~1,2%_%time:~3,2%_%time:~6,2%
 )else (
 set hour=%time:~0,2%_%time:~3,2%_%time:~6,2%
 )
 ::获取当前系统时间结束
 
 ::输出以当前时间命名的txt文件至设备文件下
 ECHO 正在抓取%m:~16%日志
 adb logcat -v time *:V >log\%name%\%day%_%hour%.txt