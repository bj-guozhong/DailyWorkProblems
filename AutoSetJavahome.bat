@echo off

:: TODO:����java��������
:: Author: ZGZ
color 02
::����java�İ�װ·�����ɷ����л���ͬ�İ汾

set home4=%%JAVA_HOME4%%
set home6=%%JAVA_HOME6%%
set home8=%%JAVA_HOME8%%
set javaPath=%home8% 

set input=
set /p "input=������java��jdk�汾(4��6��8):"
if %input% == 8 (
	set javaPath=%home8%
	echo jdk������Ϊ1.8
)else if %input% == 4 (
	set javaPath=%home4%
	echo jdk������Ϊ1.4
)else if %input% == 6 (
	set javaPath=%home6%
	echo jdk������Ϊ1.6
)else (
	set javaPath=%home8%
	echo jdk��Ĭ��1.8
)
::����еĻ�����ɾ��JAVA_HOME
::wmic ENVIRONMENT where "name='JAVA_HOME'" delete

::����JAVA_HOME
::wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%javaPath%"
wmic ENVIRONMENT where "name='JAVA_HOME' and username='<system>'" set VariableValue="%javaPath%"
echo ���óɹ�,��ǰJDK�汾Ϊ%javaPath%

taskkill /im explorer.exe /f
@echo ================================================
@echo ���濪ʼ������explorer.exe������
pause
start explorer.exe