@ECHO OFF
ECHO Generating files list...
FOR /R %%i IN (*.jpg) DO (CALL ECHO %%RANDOM:~5,1%%%%RANDOM:~4,1%%%%RANDOM:~3,1%%%%RANDOM:~2,1%%%%RANDOM:~1,1%%;%%i >> "C:\LIST.TXT")
ECHO Done. && ECHO Choosing random file...
FOR /F "TOKENS=*" %%i IN ('Type "C:\LIST.TXT" ^| SORT ^| MORE +%RANDOM:~1,1%') DO (
    FOR /F "TOKENS=2 Delims=;" %%@ IN ('ECHO %%i') DO (
        ECHO Done. && ECHO Chosen file: "%%~f@"
        COPY /Y "%%~f@" "C:\IMAGE.JPG" 1>NUL
        GOTO:EXIT
    )
)
:EXIT
CHOICE /C YN /M "Delete files list?"
IF ERRORLEVEL 2 GOTO:EXIT
DEL /Q "C:\LIST.TXT" && ECHO Done. && GOTO:EXIT
:EXIT
PAUSE&EXIT
