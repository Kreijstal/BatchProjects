@ECHO OFF

::I added a github, so all updates will be here, lol https://github.com/RainbowDangerDash/BatchProjects/blob/master/img.bat
::Allows you to see the error message.. It might not work..
if "%1"=="" cmd /k %0 OpenedWithoutParameters

::Copy this in notepad and save it as .bat
SETLOCAL enabledelayedexpansion
rem Define auxiliary While variables
set While=if %~1-%~2 equ While-^^!WhileBody^^! ( for /L %%? in () do 
set Do=(
set Break=exit ^^!WhileResult^^! 
set EndWhile=) else exit ^^!WhileResult^^! ) else for /F  %%z in ('cmd /C "%~F0" While ^^!WhileBody^^!') do set "return=%%z"
if "%1" equ "While" goto %2
set use=This program purpose is to view all the gifs or webms that exist in a directory
SET Version=1.12
set nname=%~n0
set fulllpath=%~dp0
set DefaultColor=grey

::default size is 150, perhaps you may find that more reasonable
set sizee=150
::1 is true, 0 is false
set gif=1
set jpg=1
set png=1
set webm=1
if /I "%1"=="help" (goto help) else if "%1"=="/?" (goto help) else if /I "%1"=="/h" (goto help)


::Okay, this is known as batch macros, this thing checks what formats are in a string, and avoids them
set imageAvoid=do^
 (call :indexOf res "%%f" "gif" ^
  ^&(if not "^!res^!"=="-1" set gif=0 )^
 ^&call :indexOf res "%%f" "png"^
 ^&(if not "^!res^!"=="-1" set png=0) ^
 ^&call :indexOf res "%%f" "jpg"^
 ^&(if not "^!res^!"=="-1" set jpg=0) ^
 ^&call :indexOf res "%%f" "webm"^
 ^&(if not "^!res^!"=="-1" set webm=0))^

::This macro reads %0.bat.ini if exists 
set readImgIni=do (for /f "usebackq delims=" %%b in ("%%a") do ^
set ln=%%b ^&if "^!ln:~0,1^!"=="[" (set currea=^!ln^!) else if not  "^!ln:~0,1^!"=="[" (for /f "tokens=1,2 delims==" %%c in ("^!ln^!") do ^
     call :indexOf res "%%c" "wizard"^&if "^!res^!"=="0" (^
	  call :indexOf res "%%d" "enable"^&if not "^!res^!"=="-1" (^
	   set skipWizard=0) else^
	  call :indexOf res "%%d" "disable"^&if not "^!res^!"=="-1" (^
	   set skipWizard=1)) else^
	 call :indexOf res "%%c" "pixelSize"^&if "^!res^!"=="0" (^
	  set /a sizee=%%d^
	 ) else ^
   call :indexOf res "%%c" "backgroundcolor"^&if "^!res^!"=="0" (^
	  set color=%%d^
	 ) else ^
	 call :indexOf res "%%c" "avoidFormat"^&if "^!res^!"=="0" (^
	  for /f "tokens=1-26" %%f in ("%%d") !imageAvoid! ^
	 ) else ^
	 call :indexOf res "%%c" "path"^&if /I "^!res^!"=="0" (^
	  set path2=%%d^
	 ) else call :indexOf res "%%c" "selffolder"^&if /I "^!res^!"=="0" (^
	  call :indexOf res "%%d" "enable"^&if not "^!res^!"=="-1" (^
	   set "__as=t"^
	   ) else^
	  call :indexOf res "%%d" "disable"^&if not "^!res^!"=="-1" (^
	   set "__as="^
	   )^
	 ) )^
) ^2^>nul	


 
color a
:args
::Read command line arguments
IF NOT "%1"=="" (
echo args?
IF "%skipWizard%" == "" set skipWizard=1
    IF /I "%1"=="/path" (
        SET path2=%2
        SHIFT&SHIFT
    ) ELSE IF /I "%1"=="/selfFolder" (
        SET __as=t
        SHIFT
    ) ELSE IF /I "%1"=="/size" (
        SET /a sizee=%2
        SHIFT
    ) ELSE IF /I "%1"=="/color" (
        SET /a color=%2
        SHIFT
    ) ELSE call :indexOf res %1 "/avoid"&IF  "!res!"=="0" (
        set g=%1
		SHIFT
		set g=!g:~7!
		::echo !g!
		for /f "tokens=1-26" %%f in ("!g!") %imageAvoid%

    ) ELSE (call :indexOf res %1 "/"
	IF not "!res!"=="0" call :indexOf res %1 "-" 	
	IF "!res!"=="0" (
        call :flags %1
        SHIFT
    ) ELSE (
	::Unexpected parameter
	SHIFT
	)
	
	)
    
    GOTO :args
)

::Execute macros
if exist "%~nx0.ini" echo ini found, reading configuration&for /f "tokens=1-26" %%a in ("%~nx0.ini") %readImgIni%

set currentDirectory=%cd%
set normpath=""
::echo skipWizard %skipWizard%?&pause
if not "%skipWizard%" == "1" call :Wizard
if not exist "%path2%" (
echo no path specified assuming default path) else (cd %path2%>nul
if not "%__as%"=="t"  set normpath=%path2%\)
IF NOT "%OS%"=="Windows_NT" GOTO End

set imgext=0
set webmext=0
set check=
if %gif%==1 (set check=IF NOT EXIST *.GIF
if exist *.GIF set imgext=1)
if %jpg%==1 (set check=%check% IF NOT EXIST *.JPG IF NOT EXIST *.JPEG
if exist *.JPG set imgext=1
if exist *.JPEG set imgext=1)
if %png%==1 (set check=%check% IF NOT EXIST *.PNG
if exist *.PNG set imgext=1)
if %webm%==1 (set check=%check% IF NOT EXIST *.WEBM
if exist *.WEBM set webmext=1)
if "%check%"=="" (echo errr, you've chosen not to display gifs, nor pngs, jpgs, webms.
echo soo what do you want to do?
pause>nul
goto End
)
%check% (echo WWOOP, I didn't found files in current directory
pause>nul
goto end)

REM THIS DOESN'T WORK FOR PATHS WITH SPACES!!!
set LAST_WORD=%CD: =_%
for %%i in (%LAST_WORD:\= %) do set LAST_WORD=%%i
SET "OutFile=%nname%%LAST_WORD%.html" 

REM Creating a Newline variable (the two blank lines are required!)
set NL=^


REM EXPANSION ENABLED!!! How does it work?
REM set NL=^^^%NLM%%NLM%^%NLM%%NLM%

if not "%__as%"=="t" (set OutFile="%fulllpath%%OutFile%")
set check=
if %gif%==1 set check=GIFs
if %jpg%==1 (if not "%check%"=="" set "check=%check%, "
set check=!check!JGPs)
if %png%==1 (if not "%check%"=="" set "check=%check%, "
set check=!check!PNGs)
if %webm%==1 (if not "%check%"=="" set "check=%check%, "
set check=!check!WEBMs)
echo %OutFile%
::Javascript function to replace HTML to batch escaped echo.
::function ASCIIToEncodedBatch(str){return str.replace(/%/g,'%%').replace(/\^/g,'^^').replace(/[&\|<>"'`\=\\\/,;\(!\)0-9]/g,function(a){return '^'+a;}).replace(/[\n\r]/g,function(a){return '^'+a+a})}
> %OutFile% ECHO ^<html^>
>> %OutFile% ECHO ^<head^>
>> %OutFile% ECHO ^<title^>All %check% found in directory %CD%^</title^>
::Stylesheet of the output HTML
>> %OutFile% ECHO ^<style^>body{background:^%DefaultColor%^;font-family:sans-serif^;color:black}img{width:%sizee%px^;height:%sizee%px}ul{padding:0^;list-style: none^;}li{float:left^;margin:^2px}^<^/style^>
>> %OutFile% ECHO ^</head^>
>> %OutFile% ECHO ^<body^>
>> %OutFile% ECHO ^<h2^>%CD%^</h2^>
>> %OutFile% ECHO Click on them for full view. ^<br^>^<label^>Expand them: ^<select id^=^"s^"^>^<option^>At full size^<^/option^>^<option^>Without overflowing^<^/option^>^<option^>Without overflowing height^<^/option^>^<option^>Without overflowing width^<^/option^>^<^/select^>^<^/label^>^<label^>Expand all^<input id^=^"all^" type^=^"checkbox^"^>^<^/label^>^<br^>^<label^>Upload:^<input type^=^"file^" multiple^=^"^" accept^=^"image^/*^" id^=^"file^"^>^<^/label^>
>> %OutFile% ECHO ^<ul^>
set check=
if %gif%==1 set check= *.GIF
if %jpg%==1 set check=%check% *.JPG *.JPEG
if %png%==1 set check=%check% *.PNG

if %imgext%==1 (for /f "tokens=* delims=" %%A in ('dir /b/a   %check%') DO (
>> %OutFile% ECHO ^<li^>^<img src= '!normpath:"=!%%A' alt^=^"%%A image^" title="Image's path is !normpath:"=!%%A"^>^</li^>
Echo %%A Added successfully.
) )

if %webmext%==1 (for /f "tokens=* delims=" %%A in ('dir /b/a   *.webm') DO (
>> %OutFile% ECHO ^<video controls="" autoplay="" name="media"^>^<source src^=^'!normpath:"=!%%A^' type="video/webm"^>^</video^>
))

echo ^</ul^> >> %OutFile%
::JavaScript of the output HTML
>> %OutFile% ECHO ^<script^>function imageSize^(imgElement^){!NL!if^(imgElement.big^){!NL!imgElement.style.height^=%sizee%^;!NL!imgElement.style.width^=%sizee%^;!NL!imgElement.big^=false^;!NL!return^;!NL!}!NL!var i^=new Image!NL!i.onload^=function^(^){!NL!var x^={height:i.height^,width:i.width}!NL!var h^=b.clientHeight^,w^=b.clientWidth^,aspectRatioDiff^=^1^;!NL!switch^(s.selectedIndex^){!NL!case ^1:!NL!if^(x.height^>h^){!NL!aspectRatioDiff^=x.height^/h^;!NL!x.height^/^=aspectRatioDiff^;!NL!x.width^/^=aspectRatioDiff^;!NL!}!NL!case ^3:!NL!if^(x.width^>w^){!NL!aspectRatioDiff^=x.width^/w^;!NL!x.height^/^=aspectRatioDiff^;!NL!x.width^/^=aspectRatioDiff^;!NL!}!NL!break^;!NL!case ^2:!NL!if^(x.height^>h^){!NL!aspectRatioDiff^=x.height^/h^;!NL!x.height^/^=aspectRatioDiff^;!NL!x.width^/^=aspectRatioDiff^;!NL!}!NL!break^;!NL!}!NL!imgElement.style.height^=x.height^;!NL!imgElement.style.width^=x.width^;!NL!imgElement.big^=true!NL!}!NL!i.src^=imgElement.src^;!NL!}!NL!document.addEventListener^(^'click^'^,function^(a^){!NL!if^(a.target^&^&a.target.src^)!NL!imageSize^(a.target^)!NL!}^,false^)!NL!var s^=document.getElementById^(^'s^'^)^,b^=document.documentElement.getElementsByTagName^(^'body^'^)[^0]^;var but^=document.getElementById^(^'all^'^)^;but^&^&but.addEventListener^(^'click^'^,function^(a^){!NL!!NL!for^(var i^=^0^;i^<document.images.length^;i++^){!NL!if^(document.images[i].big^^^^but.checked^){!NL!imageSize^(document.images[i]^)^;!NL!}!NL!}!NL!!NL!}^,false^)^;var ul^=document.getElementsByTagName^(^'ul^'^)[^0]^;!NL!file.addEventListener^(^'change^'^,function^(a^){!NL!for^(var i^=^0^;i^<file.files.length^;i++^){!NL!readFile^(file.files[i]^)^;!NL!}!NL!}^,false^)!NL!function fileDone^(reader^){!NL!^/^/a new function just to put an argument as a closure? fuck!NL!return function^(ev^){!NL!var li^=document.createElement^(^'li^'^)^,img^;!NL!^(img^=new Image^).src^=reader.result^;!NL!li.appendChild^(img^)^;!NL!ul.appendChild^(li^)^;!NL!}!NL!}!NL!function readFile^(file^){!NL!var reader^=new FileReader^;!NL!reader.addEventListener^(^'loadend^'^,fileDone^(reader^)^,false^)^;!NL!reader.readAsDataURL^(file^)!NL!}^<^/script^>
>> %OutFile% ECHO ^</body^>
>> %OutFile% ECHO ^</html^>

start "Hai there^!"  %OutFile%

cd %currentDirectory%
ENDLOCAL
pause
GOTO:EOF
goto end
:help
Echo  %use%
echo It creates an HTML file of the images located in a directory.
echo.
echo %0 [/s] [/g] [/selfFolder] [/path path]  [/size size] [/avoid:files] [/color color]
echo.
echo   /selfFolder it simply writes the html file in the directory you specified. if any
echo   /path if you want to make an html file of all the images in some directory
echo   /g Only gifs, it won't display webms nor other formats (!INCOMING)
echo   /size specify size in pixels of the previews
echo   /avoid it specifies what formats you want to avoid ex: /avoid:png,jpg
echo   /paged
echo   /color color
echo   /s skips wizard
echo if you specify no directory it will start in current directory.
goto End
:indexOf <resultVar> <str> <find> 
SETLOCAL
set "str=%~2"
set "find=%~3"
::CASE INSENSITIVE!
call :set part "%%str:%find%=&rem.%%"
set part2=%part%
::echo part is "%part%"
call :strLen part2 len
::echo len is %len%
call :strLen find len2
call :set sbstr "%%str:~%len%,%len2%%%"
::echo %str%
( ENDLOCAL
if /i "%sbstr%"=="%~3" (set "%~1=%len%") else (
set "%~1=-1")
EXIT /b
)
:strLen string len -- returns the length of a string
(   SETLOCAL ENABLEDELAYEDEXPANSION
    set "str=A!%~1!"&rem keep the A up front to ensure we get the length and not the upper bound
                     rem it also avoids trouble in case of empty string
    set "len=0"
    for /L %%A in (12,-1,0) do (
        set /a "len|=1<<%%A"
        for %%B in (!len!) do if "!str:~%%B,1!"=="" set /a "len&=~1<<%%A"
    )
)
( ENDLOCAL & REM RETURN VALUES
    IF "%~2" NEQ "" SET /a %~2=%len%
)
EXIT /b
:set
set "%~1=%~2"
exit /b
:flags
set flags=%~1
set flags=%flags:~1%
:flags2
IF NOT "!flags!"=="" (
set fchar=!flags:~0,1!
	IF /I "!fchar!"=="s" (
	    set flags=flags:~0,-1%
		set skipWizard=1
	) ELSE IF /I "!fchar!"=="g" (
	    set flags=!flags:~0,-1!
		set jpg=0
		set png=0
		set webm=0
	) ELSE (
	set flags=!flags:~0,-1!
	)
goto :flags2
)
::clearing vars is always gut
set "flags="
set "fchar="
exit /b
:Wizard
Echo. 
echo. 
Echo  %use%
echo.                                           __._`.*.'_._
echo.                                   .   . +  * .o   o.* `.`. +.
echo.                                      ^*  . ' ' ^|^\^/^|  `. * .  * 
echo.    Hello! This is the wizard, it will aid you   \V/  choosing the           
echo.                         parameters you want.   /_\             
echo.                                               _/ \_ 
Echo.   You can also open this file from command line to choose
Echo.   parameters more directly.
echo. 
echo.

call :choice "Do you want to skip the wizard? (Y/N)" "YNyn"
if /I %key%== Y (exit /b) else if /I NOT %key%== N (
:unexopt
Echo that option is unexistant, skipping wizard..
Exit /b
)
Echo.
set /p opt=Write the path if any of where the folder with the images is, if it's in the same folder as this file just press enter: 
if not "%opt%"=="" set path2=%opt%
set "opt="
if not exist "%path2%" (goto :form)
call :choice "Do you want the resulting file to be in the path you chose? (Y/N)" "YNyn"
if /I %key%== Y (set "__as=t") else if /I %key%== N (set "__as=") else goto unexopt
:form
call :choice "Do you want to avoid any file format? (Y/N)" "YNyn"
if /I %key%== Y (
call :choice "Do you want to avoid PNGs? (Y/N)" "YNyn"
if /I !key!== Y (set png=0) else if /I not !key!== N goto unexopt
call :choice "Do you want to avoid JPGs? (Y/N)" "YNyn"
if /I !key!== Y (set jpg=0) else if /I not !key!== N goto unexopt
call :choice "Do you want to avoid WEBMs? (Y/N)" "YNyn"
if /I !key!== Y (set webm=0) else if /I not !key!== N goto unexopt
call :choice "Do you want to avoid GIFs? (Y/N)" "YNyn"
if /I !key!== Y (set gif=0) else if /I not !key!== N goto unexopt
) else if /I NOT %key%== N goto unexopt
call :choice "Do you want to format the output HTML? (Y/N)" "YN"
if /I %key%== Y (echo.&echo Great! let's move on now) else if /I %key%== N (goto optsav) else goto unexopt
echo.
set /p opt=Type how many pixels large, you want the images to be:
if not "%opt%"=="" SET /a sizee=%opt%
set /p opt=Type the background color (HTML ruls):
if not "%opt%"=="" SET DefaultColor=%opt%
:optsav

call :choice "Do you want to save these options (to %~nx0.ini)? (Y/N)" "YNyn"
::echo on
if /I %key%== Y (echo.&echo Saving.. settings
echo path=%path2% > %~nx0.ini
set /p " =selfFolder=" <nul >>%~nx0.ini
if "__as"=="t" (echo enable>>%~nx0.ini) else (echo disable>>%~nx0.ini)
set check=
if %gif%==0 set check=GIF
if %jpg%==0 (if not "!check!"=="" set "check=!check!,"
set check=!check!JGP)
if %png%==0 (if not "!check!"=="" set "check=!check!,"
set check=!check!PNG)
if %webm%==0 (if not "!check!"=="" set "check=!check!,"
set check=!check!WEBM)
set /p " =avoidFormat=" <nul >>%~nx0.ini
echo.!check!>> %~nx0.ini
set /p " =backgroundcolor=" <nul >>%~nx0.ini
echo.%DefaultColor%>> %~nx0.ini
echo pixelSize=%sizee% >> %~nx0.ini
set /p " =Wizard=" <nul >>%~nx0.ini
call :choice "Do you want this wizard to appear next time? (Y/N)" "YNyn"
if /I %key%== Y (echo enable>>%~nx0.ini) else if /I %key%== N (echo disable>>%~nx0.ini)  else goto unexopt
) else if /I %key%== N (exit /b) else goto unexopt

Exit /b
:choice [question] [validkeys]
set key=
set /p " =%1" <nul
call :getKeyPres key
echo %key%
call :indexof res %2 %key%
if "%res%"=="-1" goto :choice
set res=
exit /b

:getKeyPres [key]
setlocal
:: define LF as a Line Feed (newline) character
set ^"LF=^

^" Above empty line is required - do not remove

:: define CR as a Carriage Return character
for /f %%A in ('copy /Z "%~dpf0" nul') do set "CR=%%A"

:: define BS as a BackSpace character
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"
for /f "delims=" %%A in ('xcopy /w "%~f0" "%~f0" 2^>nul') do (
      if not defined key set "key=%%A"
    )
set "key=!key:~-1!"
if !key! equ !CR! set "key={Enter}"

(endlocal
set	%~1=%key%)
Exit /b

:End
end setlocal
SET Version=