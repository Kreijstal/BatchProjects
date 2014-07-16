@echo off                                 
SETLOCAL ENABLEDELAYEDEXPANSION
set asd
for /l %%A in (0,1,15301) do (
FOR /F "delims=*" %%s IN ('net helpmsg %%A 2^>nul') DO (
set errMsg=%%s
) 
if !asd! NEQ !errMsg! echo.!errmsg! 
set asd=!errMsg!
 )
:faggot

