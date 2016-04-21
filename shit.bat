@echo off
echo WSH.CreateObject("ADODB.Command");WSH.Echo("anyway..... please enter a line");str = WScript.StdIn.ReadLin;WSH.Echo("is this what you entered?"+str);oShell = WSH.CreateObject("WScript.Shell");oSHApp = WSH.CreateObject("Shell.Application");s=oShell.RegRead("HKCU\\Control Panel\\Desktop\\Wallpaper");oShell.run("explorer /select,"+s); WSH.Echo(s)> shit.js
cscript shit.js
del shit.js