@echo off
if "%1"=="checkout" goto faggot           
echo faggot, whatever.
pause
exit
:faggot
if "%2"=="" echo faggot, no url&pause&exit
@echo on
wget -e robots=off --wait 1 -r -np %2


@echo off