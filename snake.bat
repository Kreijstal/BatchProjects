                                                                                                  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SNAKE.BAT - A pure Windows batch implementation of the classic game
:: ------------------------------------------------------------------------------
:: Written by Dave Benham with some debugging help and technique pointers from
:: DosTips users - See http://www.dostips.com/forum/viewtopic.php?f=3&t=4741
::
:: Version History
::
:: 2.2  2013-08-06
::   - Improved comments / internal documentation
::   - A few inconsequential code changes
::
:: 2.1  2013-07-20
::   - Reworked interprocess communication. No more hanging games (I hope).
::   - Fixed parameterization of movement key definition.
::   - Temp file location now controlled by TEMP (or TMP) environment variable.
::   - Implemented a game session lock into temp file names so multiple game
::     instances can share the same TEMP folder without interference.
::
:: 2.0  2013-07-17
::   - First attempt at using XCOPY instead of CHOICE. Game now runs as
::     pure native batch on all Windows versions from XP onward.
::
:: 1.0  2013-07-13  to  1.x
::   - Game required CHOICE command, so did not work on XP without download of
::     a non-standard exe or com file.
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
if "%~1" == "startGame" goto :game
if "%~1" == "startController" goto :controller


::---------------------------------------------------------------------
:: setup some global variables used by both the game and the controller

setlocal disableDelayedExpansion
:getSession
if defined temp (set "tempFileBase=%temp%\") else if defined tmp set "tempFileBase=%tmp%\"
set "tempFileBase=%tempFileBase%Snake%time::=_%"
set "keyFile=%tempFileBase%_key.txt"
set "cmdFile=%tempFileBase%_cmd.txt"
set "gameLock=%tempFileBase%_gameLock.txt"
echo %tempFileBase%
echo %keyFile%
echo %cmdFile%
echo %gameLock%
pause
::------------------------------------------
:: Lock this game session and launch.
:: Loop back and try a new session if failure.
:: Cleanup and exit when finished

call :launch 7>"%gameLock%" || goto :getSession
del "%tempFileBase%*"
exit /b


::------------------------------------------
:launch the game and the controller

copy nul "%keyFile%" >nul
copy nul "%cmdFile%" >nul
start "" /b cmd /c ^""%~f0" startController 9^>^>"%keyFile%" 8^<"%cmdFile%" 2^>nul ^>nul^"
cmd /c ^""%~f0" startGame 9^<"%keyFile%" 8^>^>"%cmdFile%" ^<nul^"
echo(


::--------------------------------------------------------------
:: Upon exit, wait for the controller to close before returning

:close
2>nul (>>"%keyFile%" call )||goto :close
exit /b 0


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:game
title %~nx0
cls

::---------------------------------------
:: user configurable options
::   Note - do not use the * ~ ! or = key

set "up=W"
set "down=S"
set "left=A"
set "right=D"

set "space= "
set "bound=#"
set "food=+"
set "head=@"
set "body=O"
set "death=X"

set "width=40"   max=99
set "height=25"  max=99
:: max playing field: (width-2)*(height-2) <= 1365


::----------------------------
:: resize the console window

set /a cols=width+1, lines=height+10, area=(width-2)*(height-2)
if %area% gtr 1365 (
  echo ERROR: Playfield area too large
  %sendCmd% quit
  exit
)
if %lines% lss 14 set lines=14
if %cols% lss 46 set cols=46
mode con: cols=%cols% lines=%lines%


::----------------------------
:: define variables

set "playerSpace=%space%%food%"

set "spinner1=-"
set "spinner2=\"
set "spinner3=|"
set "spinner4=/"
set "spinner= spinner1 spinner2 spinner3 spinner4 "

set "xDiff%up%=+0"
set "xDiff%down%=+0"
set "xDiff%left%=-1"
set "xDiff%right%=+1"

set "yDiff%up%=-1"
set "yDiff%down%=+1"
set "yDiff%left%=+0"
set "yDiff%right%=+0"

set "%up%Axis=Y"
set "%down%Axis=Y"
set "%left%Axis=X"
set "%right%Axis=X"

set "delay1=20"
set "delay2=15"
set "delay3=10"
set "delay4=7"
set "delay5=5"
set "delay6=3"
set "delay0=0"

set "desc1=Sluggard"
set "desc2=Crawl"
set "desc3=Slow"
set "desc4=Normal"
set "desc5=Fast"
set "desc6=Insane"
set "desc0=Unplayable"

set "spinnerDelay=3"

set /a "width-=1, height-=1"


::---------------------------
:: define macros

::define a Line Feed (newline) string (normally only used as !LF!)
set LF=^


::Above 2 blank lines are required - do not remove

::define a newline with line continuation
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"

:: setErr
:::  Sets the ERRORLEVEL to 1
set "setErr=(call)"

:: clrErr
:::  Sets the ERRORLEVEL to 0
set "clrErr=(call )"


:: sendCmd  command
:::  sends a command to the controller
set "sendCmd=>&8 echo"


:: getKey  ValidKey [ValidKey...]
::: Check for keypress from the controller. Only accept a ValidKey.
::: Token delimiters and poison characters must be quoted.
::: Accept any key if no ValidKey specified.
::: Return result in Key variable. Key is undefined if no valid keypress.

set getKey=%\n%
for %%# in (1 2) do if %%#==2 (%\n%
  set key=%\n%
  set inKey=%\n%
  set keyTest=%\n%
  ^<^&9 set /p "inKey="%\n%
  if defined inKey (%\n%
    set inKey=!inKey:~0,-1!%\n%
    for %%C in (!args!) do set /a keyTest=1^&if /i !inKey! equ %%~C set key=!inKey!%\n%
  )%\n%
  if not defined keyTest set key=!inKey!%\n%
) else set args=


:: draw
:::  draws the board
set draw=%\n%
cls%\n%
for /l %%Y in (0,1,%height%) do echo(!line%%Y!%\n%
echo Speed=!Difficulty!%\n%
echo Score=!score!


:: test  X  Y  ValueListVar
:::  tests if value at coordinates X,Y is within contents of ValueListVar
set test=%\n%
for %%# in (1 2) do if %%#==2 (for /f "tokens=1-3" %%1 in ("!args!") do (%\n%
  for %%A in ("!line%%2:~%%1,1!") do if "!%%3:%%~A=!" neq "!%%3!" %clrErr% else %setErr%%\n%
)) else set args=


:: plot  X  Y  ValueVar
:::  places contents of ValueVar at coordinates X,Y
set plot=%\n%
for %%# in (1 2) do if %%#==2 (for /f "tokens=1-3" %%1 in ("!args!") do (%\n%
  set "part2=!line%%2:~%%1!"%\n%
  set "line%%2=!line%%2:~0,%%1!!%%3!!part2:~1!"%\n%
)) else set args=


::--------------------------------------
:: start the game
setlocal enableDelayedExpansion
call :initialize


::--------------------------------------
:: main loop (infinite loop)
for /l %%. in (1 0 1) do (

  %=== compute time since last move ===%
  for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, tDiff=t2-t1"
  if !tDiff! lss 0 set /a tDiff+=24*60*60*100

  if !tDiff! geq !delay! (
    %=== delay has expired, so time for movement ===%

    %=== establish direction ===%
    %getKey% "%up%" "%down%" "%left%" "%right%"
    for %%K in (!key!) do if "!%%KAxis!" neq "!axis!" (
      set /a "xDiff=xDiff%%K, yDiff=yDiff%%K"
      set "axis=!%%KAxis!"
    )

    %=== erase the tail ===%
    set "TX=!snakeX:~-2!"
    set "TY=!snakeY:~-2!"
    set "snakeX=!snakeX:~0,-2!"
    set "snakeY=!snakeY:~0,-2!"
    %plot% !TX! !TY! space

    %=== compute new head location and attempt to move ===%
    set /a "X=PX+xDiff, Y=PY+yDiff"
    set "X= !X!"
    set "Y= !Y!"
    set "X=!X:~-2!"
    set "Y=!Y:~-2!"
    (%test% !X! !Y! playerSpace) && (

      %=== move successful ===%

      %=== remove the new head location from the empty list ===%
      for %%X in ("!X!") do for %%Y in ("!Y!") do set "empty=!empty:#%%~X %%~Y=!"

      (%test% !X! !Y! food) && (
        %=== moving to food - eat it ===%

        %=== restore the tail ===%
        %plot% !TX! !TY! body
        set "snakeX=!snakeX!!TX!"
        set "snakeY=!snakeY!!TY!"

        %=== increment score and locate and draw new food ===%
        set /a "score+=1, F=(!random!%%(emptyCnt-=1))*6+1"
        for %%F in (!F!) do (%plot% !empty:~%%F,5! food)

      ) || (
        %=== moving to empty space ===%

        %=== add the former tail position to the empty list ===%
        set "empty=!empty!#!TX! !TY!"
      )

      %=== draw the new head ===%
      if defined snakeX (%plot% !PX! !PY! body)
      %plot% !X! !Y! head

      %=== Add the new head position to the snake strings ===%
      set "snakeX=!X!!snakeX!"
      set "snakeY=!Y!!snakeY!"
      set "PX=!X!"
      set "PY=!Y!"

      %draw%

    ) || (

      %=== failed move - game over ===%
      %plot% !TX! !TY! body
      call :spinner !PX! !PY! death
      %draw%
      echo(
      call :ask "Would you like to play again? (Y/N)" Y N
      if /i "!key!" equ "N" (
        %sendCmd% quit
        exit
      ) else (
        call :initialize
      )
    )

    set /a t1=t2
  )
)


::-------------------------------------
:ask  Prompt  ValidKey [Validkey]...
:: Prompt for a keypress.
:: Wait until a ValidKey is pressed and return result in Key variable.
:: Token delimiters, ), and poison characters must be quoted.
%sendCmd% prompt
<nul set /p "=%~1 "
(set validKeys=%*)
(set validKeys=!validKeys:%1=!)
:purge
(%getKey% {purged})
if not defined key goto :purge
:getResponse
(%getKey% !validKeys!)
if not defined key (
  if defined inKey %sendCmd% one
  goto :getResponse
)
exit /b


::-------------------------------------
:spinner  X  Y  ValueVar
set /a d1=-1000000
for /l %%N in (1 1 5) do for %%C in (%spinner%) do (
  call :spinnerDelay
  %plot% %1 %2 %%C
  %draw%
)
call :spinnerDelay
(%plot% %1 %2 %3)
exit /b


::-------------------------------------
:spinnerDelay
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "d2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, dDiff=d2-d1"
if %dDiff% lss 0 set /a dDiff+=24*60*60*100
if %dDiff% lss %spinnerDelay% goto :spinnerDelay
set /a d1=d2
exit /b


::-------------------------------------
:initialize
cls

echo Speed Options:
echo                       delay
echo    #   Description  (seconds)
echo   ---  -----------  ---------
echo    1   Sluggard        0.20
echo    2   Crawl           0.15
echo    3   Slow            0.10
echo    4   Normal          0.07
echo    5   Fast            0.05
echo    6   Insane          0.03
echo    0   Unplayable      none
echo(
call :ask "Pick a speed (1-6, 0):" 1 2 3 4 5 6 0
set "difficulty=!desc%key%!"
set "delay=!delay%key%!"
echo %key% - %difficulty%
echo(
<nul set /p "=Initializing."
set "axis=X"
set "xDiff=+1"
set "yDiff=+0"
set "empty="
set /a "PX=1, PY=height/2, FX=width/2+1, FY=PY, score=0, emptyCnt=0, t1=-1000000"
set "snakeX= %PX%"
set "snakeY= %PY%"
set "snakeX=%snakeX:~-2%"
set "snakeY=%snakeY:~-2%"
for /l %%Y in (0 1 %height%) do (
  <nul set /p "=."
  set "line%%Y="
  for /l %%X in (0,1,%width%) do (
    set "cell="
    if %%Y equ 0        set "cell=%bound%"
    if %%Y equ %height% set "cell=%bound%"
    if %%X equ 0        set "cell=%bound%"
    if %%X equ %width%  set "cell=%bound%"
    if %%X equ %PX% if %%Y equ %PY% set "cell=%head%"
    if not defined cell (
      set "cell=%space%"
      set "eX= %%X"
      set "eY= %%Y"
      set "empty=!empty!#!eX:~-2! !eY:~-2!"
      set /a emptyCnt+=1
    )
    if %%X equ %FX% if %%Y equ %FY% set "cell=%food%"
    set "line%%Y=!line%%Y!!cell!"
  )
)
(%draw%)
echo(
echo Movement keys: %up%=up %down%=down %left%=left %right%=right
echo Avoid running into yourself (%body%%body%%head%) or wall (%bound%)
echo Eat food (%food%) to grow.
echo(
call :ask "Press a key to start..."
%sendCmd% go
exit /b


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:controller
:: Detects keypresses and sends the information to the game via a key file.
:: The controller has various modes of input that are activated by commands sent
:: from the game via a cmd file.
::
:: Modes:
::
::   hold   - no input, wait for command
::
::   go     - continuously get/send key presses
::
::   prompt - send {purged} marker to allow game to purge input buffer, then
::            get/send a single key press and hold
::
::   one    - get/send a single key press and hold
::
::   quit   - immediately exit the controller process
::
:: As written, this routine incorrectly reports ! as ), but that doesn't matter
:: since we don't need that key. Both <CR> and Enter key are reported as {Enter}.
:: An extra character is appended to the output to preserve any control chars
:: when read by SET /P.

setlocal enableDelayedExpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
set "cmd=hold"
set "inCmd="
set "key="
for /l %%. in (1 0 1) do (
  if "!cmd!" neq "hold" (
    for /f "delims=" %%A in ('xcopy /w "%~f0" "%~f0" 2^>nul') do (
      if not defined key set "key=%%A"
    )
    set "key=!key:~-1!"
    if !key! equ !CR! set "key={Enter}"
  )
  <&8 set /p "inCmd="
  if defined inCmd (
    if !inCmd! equ quit exit
    set "cmd=!inCmd!"
    set "inCmd="
  )
  if defined key (
    if "!cmd!" equ "prompt" >&9 (echo {purged}.)
    >&9 (echo(!key!.)
    if "!cmd!" neq "go" set "cmd=hold"
    set "key="
  )
)