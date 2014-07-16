@Echo off
@title Tetris v 1                         
::@mode con cols=28 lines=24

:: Batch Game - Tetris v 1
:: Proof Of Concept
:: Coded by SmartGenius
:: SmartGenius, Corp. 2010

::Choice /N /T:Y,1 >Nul 2>&1
If "%Errorlevel%"=="9009" (Echo. CHOICE command not found&Pause)

Set "Game=%0"

Call :RandomHex
echo %RandomHex.a%
echo(
hi
sup
how
ya
doing
ya
okay?
good
happy
fuckmax
)
pause
goto :Eof

:RandomHex
set /a RandomHex.a=%random%%%15
if "%RandomHex.a%"=="10" set RandomHex.a=a
if "%RandomHex.a%"=="11" set RandomHex.a=b
if "%RandomHex.a%"=="12" set RandomHex.a=c
if "%RandomHex.a%"=="13" set RandomHex.a=d
if "%RandomHex.a%"=="14" set RandomHex.a=e
if "%RandomHex.a%"=="15" set RandomHex.a=f
goto :Eof