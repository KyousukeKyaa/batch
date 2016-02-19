@Echo OFF
ECHO Generating files list...
FOR /r %%i in (*.jpg) Do (CALL Echo %%RANDOM:~5,1%%%%RANDOM:~4,1%%%%RANDOM:~3,1%%%%RANDOM:~2,1%%%%RANDOM:~1,1%%;%%i >> "C:\LIST.TXT")
ECHO Done. && Echo Choosing random file...
FOR /F "TOKENS=*" %%i in ('Type "C:\LIST.TXT" ^| SORT ^| MORE +%RANDOM:~1,1%') DO (
    For /F "TOKENS=2 Delims=;" %%@ in ('Echo %%i') do (
        PING -n 2 -w 1 0.0.0.0>nul
        ECHO Done. && ECHO Chosen file: "%%~f@"
        COPY /Y "%%~f@" "C:\IMAGE.JPG" 1>NUL
        GOTO:EXIT
    )
)
:EXIT
PING -N 2 -W 1 0.0.0.0>NUL
CHOICE /C YN /M "Delete files list?"
IF ERRORLEVEL 2 GOTO:EXIT
DEL /Q "C:\LIST.TXT" && ECHO Done. && GOTO:EXIT
:EXIT
PING -N 2 -W 1 0.0.0.0>NUL
PAUSE&EXIT
