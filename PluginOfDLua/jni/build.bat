
set NDK=D:\android\android-ndk-r10


@echo off
echo *********************************************************
echo *     ��ѡ����뷽ʽ
echo *
echo *     1. �������ȫ����Release��
echo *     2. �������ȫ����Debug��
echo *     3. ֱ�ӱ���Release��
echo *     4. ���ȫ���������
echo *********************************************************
choice /c:1234

if errorlevel 4 goto BuilDebug
if errorlevel 3 goto Release
if errorlevel 2 goto CleanNDebug
if errorlevel 1 goto CleanNRelease

:CleanNRelease
call %NDK%\ndk-build clean
call %NDK%\ndk-build
goto end

:CleanNDebug
call %NDK%\ndk-build clean
call %NDK%\ndk-build NDK_DEBUG=1
goto end

:Release
call %NDK%\ndk-build
goto end


:BuilDebug
call %NDK%\ndk-build -d
goto end

:end
pause