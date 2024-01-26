@echo off
setlocal enabledelayedexpansion

echo Le programme genere des excercices, ne pas fermer cette fenetre

echo Pour les adresses ip ci dessous>exo_ip_sous_res.txt
echo 1 - Indiquer la classe>>exo_ip_sous_res.txt
echo 2 - Indiquer si l'adresse est privée ou publique>>exo_ip_sous_res.txt
echo 3 - Indiquer le masque de sous réseau en decimal pointé>>exo_ip_sous_res.txt
echo 4 - Indiquer la limite basse du réseau (adresse du réseau)>>exo_ip_sous_res.txt
echo 5 - Indiquer la limite haute du réseau (adresse de broadcast)>>exo_ip_sous_res.txt
echo 6 - Indiquer le nombre d'adresses utilisables dans le réseau>>exo_ip_sous_res.txt
echo 7 - Indiquer le nombre de sous réseaux crées>>exo_ip_sous_res.txt
echo.>>exo_ip_sous_res.txt
set n=1
:start
if %n% leq 10 goto gena
echo les excercices sont dans le fichier exo_ip_sous_res.txt
ping 127.0.0.1>nul 
exit
:gena
set a=%random%
if %a% gtr 223 goto gena
:genb
set b=%random%
if %b% gtr 255 goto genb
:genc
set c=%random%
if %c% gtr 255 goto genc
:gend
set d=%random%
if %d% gtr 255 goto gend

if %a% lss 128 goto nma
if %a% lss 192 goto nmb
goto nmc

:nma
set nm=%random%
if %nm% gtr 30 goto nma
if %nm% lss 8 goto nma
goto result

:nmb
set nm=%random%
if %nm% gtr 30 goto nmb
if %nm% lss 16 goto nmb
goto result

:nmc
set nm=%random%
if %nm% gtr 30 goto nmc
if %nm% lss 24 goto nmc
goto result

:result
echo %a%.%b%.%c%.%d%/%nm%>>exo_ip_sous_res.txt
set /a n=n+1
echo.>>exo_ip_sous_res.txt
goto start
