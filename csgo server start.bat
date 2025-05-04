@echo off
REM 自定义变量
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

REM 切换到 CS:GO 服务器目录
cd /d "C:\csgo_server"

REM 运行服务器的命令
set CMD=srcds.exe -game csgo +sv_setsteamaccount %SETSTEAMACCOUNT% -tickrate %TICKRATE% -console -usercon -ip %IP% +game_type %GAME_TYPE% +game_mode %GAME_MODE% +map %MAP% -maxplayers_override %MAXPLAYERS% +port %PORT% -nobots -insecure +hostname "%HOSTNAME%"

REM 检查是否已有服务器进程运行
tasklist | findstr "srcds.exe" > nul
if %ERRORLEVEL% == 0 (
    echo 正在终止现有的 CS:GO 服务器进程...
    taskkill /IM srcds.exe /F
)

REM 在新窗口启动服务器
start "CSGO Server" cmd /c %CMD%

echo CS:GO 服务器已启动，名称：%SERVER_NAME%，端口：%PORT%。
pause