@echo off
REM �Զ������
set TICKRATE=64
set IP=0.0.0.0
set GAME_TYPE=0
set GAME_MODE=2
set MAP=de_inferno
set MAXPLAYERS=24
set PORT=27015
set SERVER_NAME=csgo_server
set HOSTNAME=FASTER
set SETSTEAMACCOUNT=A1E81ECFB827F7BB0D98BD766FC4014A

REM �л��� CS:GO ������Ŀ¼
cd /d "C:\csgo_server"

REM ���з�����������
set CMD=srcds.exe -game csgo +sv_setsteamaccount %SETSTEAMACCOUNT% -tickrate %TICKRATE% -console -usercon -ip %IP% +game_type %GAME_TYPE% +game_mode %GAME_MODE% +map %MAP% -maxplayers_override %MAXPLAYERS% +port %PORT% -nobots -insecure +hostname "%HOSTNAME%"

REM ����Ƿ����з�������������
tasklist | findstr "srcds.exe" > nul
if %ERRORLEVEL% == 0 (
    echo ������ֹ���е� CS:GO ����������...
    taskkill /IM srcds.exe /F
)

REM ���´�������������
start "CSGO Server" cmd /c %CMD%

echo CS:GO �����������������ƣ�%SERVER_NAME%���˿ڣ�%PORT%��
pause