# WindowsUpdateSetting

The PowerShell commands in this module are intended to make it easier to automate the process of pausing and resuming Windows Updates on a Windows 10 desktop as well as a few other update related settings.

Normally, you would use Settings to pause Windows Update for 35 days.

![settings](./assets/settings.png)

You can use this module to toggle that setting from a PowerShell prompt.

```powershell
PS C:\> Suspend-WindowsUpdate -passthru

Computername  : BOVINE320
UpdatesPaused : True
PauseStartUTC : 9/20/2018 2:06:28 PM
PauseEndUTC   : 10/25/2018 2:06:28 PM
Remaining     : 35.03:59:59.1529862
```

Or you can specify a date, as long as it is less than 35 days. Use `Get-WindowsUpdateSetting` to view the current values or `Test-IsWindowsUpdatePaused` to test.

This module also contains commands to set your active hours.

![activehours](./assets/activehours.png)

```powershell
PS C:\> Get-WindowsActiveHours

Computername ActiveHoursStart ActiveHoursEnd
------------ ---------------- --------------
BOVINE320                   6             21


PS C:\> Set-WindowsActiveHours -StartTime 6:00 -EndTime 20:00 -Passthru

Computername ActiveHoursStart ActiveHoursEnd
------------ ---------------- --------------
BOVINE320                   6             20
```

The module also contains commands to manage deferrals of certain updates.

![deferrals](./assets/deferrals.png)

You can view and modify these settings.

```powershell
PS C:\> Get-WindowsUpdateDeferral

Computername FeatureUpdateDeferral QualityUpdateDeferral
------------ --------------------- ---------------------
BOVINE320                       30                     7


PS C:\> set-WindowsUpdateDeferral -Feature 0 -Quality 0 -Passthru

Computername FeatureUpdateDeferral QualityUpdateDeferral
------------ --------------------- ---------------------
BOVINE320                       30                     7
```

**You should test all of these commands on a non-production system**

 *last updated 9/20/2018*
