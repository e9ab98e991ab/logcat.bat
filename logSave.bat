::bat����ץȡAndroid�豸��logcat����������ʱ��������txt�ļ����豸Ŀ¼ 1 @ECHO off
 adb wait-for-device
 ECHO ���������豸
 adb logcat -c
 @ECHO off
 ::��ȡ�豸����
 adb pull system/build.prop log\temp.txt
 find "ro.product.name" log\temp.txt >log\1.txt
 for /f "skip=2" %%i in (log\1.txt) do set m=%%i
 set name=%m:~16%
 ::��ȡ�豸���ƽ���
 
 ::�½��豸�ļ���
 if not exist log\%name% md log\%name%
 del log\temp.txt
 del log\1.txt
 ::�½��豸�ļ��н���
 
 ::��ȡ��ǰϵͳʱ��
 set day=%date:~0,4%%date:~5,2%%date:~8,2%
 set temp=%time:~0,2%
 if /i %temp% LSS 10 (
 set hour=0%time:~1,2%_%time:~3,2%_%time:~6,2%
 )else (
 set hour=%time:~0,2%_%time:~3,2%_%time:~6,2%
 )
 ::��ȡ��ǰϵͳʱ�����
 
 ::����Ե�ǰʱ��������txt�ļ����豸�ļ���
 ECHO ����ץȡ%m:~16%��־
 adb logcat -v time *:V >log\%name%\%day%_%hour%.txt