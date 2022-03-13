:: Title:       Peter's CMD Profile
:: Author:      Peter James Mangelsdorf (peter201943)
:: License:     MIT Software License
:: Created:     2020-06-01T10:19:00-05:00
:: Edits: 
::   2021-01-25T11:52:00-05:00: Last Anomalous Edit
::   2022-03-13T14:06:00-04:00: Added Custom Python Launcher; Renamed Profile Edit Command

:: Do not display following commands on command line
@echo off

:: Alias Show Keys
doskey a=doskey/macros

:: Alias Battery Level
doskey bl=WMIC PATH Win32_Battery Get EstimatedChargeRemaining

:: Alias Battery Report
doskey br=powercfg /batteryreport

:: Shortcut for Screen Clear
doskey c=cls

:: Alias View Disk Space
doskey disc=wmic logicaldisk get size,freespace,caption

:: Alias Unix-Style Short Directory Listing for ALL files
doskey l=dir /b /oe ^&^& dir /b /oe /ah

:: Alias Shortcut to my Notes
doskey p=cd "C:\Users\peter\projects"

:: Alias Peter-Py Support
doskey pp=py -i C:\Users\peter\projects\peter-py\peterpy\__main__.py

:: Alias Change profile settings
doskey ppath=echo "%USERPROFILE%\profile.cmd"
doskey pedit=code "%USERPROFILE%\profile.cmd"
doskey preload="%USERPROFILE%\profile.cmd"

:: Alias Dragon Art
doskey roar=type "%USERPROFILE%\dragon"

:: Alias Inspect System
doskey sys1=systeminfo
doskey sys2=wmic path win32_VideoController get name
doskey sys3=wmic path win32_VideoController get DriverVersion

:: Alias Replace Task Manager
doskey t=tasklist $B sort /R /+58

:: Clear Screen
cls

:: Display Startup Logo and Info
type "%USERPROFILE%\dragon"
echo ===        Peter's CMD Profile v2021.01.25        ===

:: References
:: [Aliases in Windows command prompt](https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt)
:: [How to sort the tasklist in the command prompt?](https://stackoverflow.com/questions/9661381/how-to-sort-the-tasklist-in-the-command-prompt)
:: [dir Parameters](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/dir#parameters)
:: [Preserving doskey context after pipe, or, and](https://stackoverflow.com/questions/52219330/preserving-doskey-context-after-pipe-or-and)
:: [How to check Battery level using Command line in Windows 10](https://www.thewindowsclub.com/check-battery-level-using-command-line)
:: [How To Check Graphics Card Specs On Windows 10](https://thedroidguy.com/how-to-check-graphics-card-specs-on-windows-10-1138037)
:: [Hard disk information from command prompt](https://social.technet.microsoft.com/Forums/windowsserver/en-US/a2f8e48e-38fc-4bc6-9e0e-e7cedea83d66/hard-disk-information-from-command-prompt?forum=winservergen)
:: [Free space in a CMD shell](https://stackoverflow.com/questions/293780/free-space-in-a-cmd-shell)
:: [How to use && within a doskey?](https://superuser.com/questions/1263042/how-to-use-within-a-doskey)

