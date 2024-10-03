::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGyX8VAjFAtBTgiLP1eqFLob+un20OyOrkgOaPErd5/M26CNKNwB71brYIQu00ZXmcNMBRhXcFyibQBU
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGyX8VAjFAtBTgiLP1eqFLob+un20OyOrkgOaPErd5/M26CNKNwR61Hnfak533dfioUJFB44
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal
title Timer
IF EXIST "D:\Users\public\program_files\stopwatch\resource\rmndr.txt" (
  start "" "D:\users\Jebbidan\random\Sticky Notes.lnk" 
  goto home
) ELSE (
  goto home
)

:home
cls
echo choose...
echo.
"D:\Users\public\program_files\stopwatch\resource\cmdmenusel.exe" cff2 "begin timer" "begin multiple timer" "open calculator" "reminder setting" "exit"
if %errorlevel% == 1 goto start
if %errorlevel% == 2 goto multitimer
if %errorlevel% == 3 start calc
if %errorlevel% == 4 goto remindy
if %errorlevel% == 5 exit
goto home

:start
title Enter your time
cls
echo Enter time to countdown from...
echo.
echo or type back/b to go back 
echo to the main menu.
echo.
set/p "time=>"
if %time% == b goto home
if %time% == back goto home
for /f "delims=0123456789" %%a in ("%time%") do (
echo.
    echo Invalid input. 
echo Please enter a number.
echo.
    pause 
    goto start
)
set time=%time%

:loop
cls

set /a time=%time%-1
if %time%==0 goto timesup

title Counting down...

echo.
echo.

echo.
echo Countdown - [%time%]

timeout /t 1 /nobreak >nul
goto loop

:timesup
cscript //nologo "D:\Users\public\program_files\stopwatch\resource\run.vbs"
"D:\Users\public\program_files\stopwatch\resource\ffplay.exe" -loop -1 "D:\Users\public\program_files\stopwatch\resource\error.mp3"
echo.
echo.
echo.
echo Time is Up!!
echo.
pause
goto start

:multitimer
psrun "D:\Users\public\program_files\stopwatch\chain_count.ps1"
goto home

:remindy
cls
echo enable or disable reminder?
echo.
"D:\Users\public\program_files\stopwatch\resource\cmdmenusel.exe" cff2 "enable" "disable" "go back" 
if %errorlevel% == 1 goto enableReminder
if %errorlevel% == 2 goto disableReminder
if %errorlevel% == 3 goto home
goto remindy

:enableReminder
echo this is just a setting file. >> "D:\Users\public\program_files\stopwatch\resource\rmndr.txt"
echo. >> "D:\Users\public\program_files\stopwatch\resource\rmndr.txt"
echo DO NOT DELETE! >> "D:\Users\public\program_files\stopwatch\resource\rmndr.txt"
copy /y "D:\users\Jebbidan\random\Sticky Notes.lnk" "C:\Users\salma\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Sticky Notes.lnk"
echo.
echo.
echo reminder is enabled.
echo.
echo press any key to clear this message
pause >nul
goto remindy

:disableReminder
del /q "D:\Users\public\program_files\stopwatch\resource\rmndr.txt"
del "C:\Users\salma\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Sticky Notes.lnk"
echo.
echo.
echo reminder is disabled.
echo.
echo press any key to clear this message
pause >nul
goto remindy