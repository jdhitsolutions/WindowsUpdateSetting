# WindowsUpdateSetting

[![PSGallery Version](https://img.shields.io/powershellgallery/v/WindowsUpdateSetting.png?style=for-the-badge&label=PowerShell%20Gallery)](https://www.powershellgallery.com/packages/WindowsUpdateSetting/) [![PSGallery Downloads](https://img.shields.io/powershellgallery/dt/WindowsUpdateSetting.png?style=for-the-badge&label=Downloads)](https://www.powershellgallery.com/packages/WindowsUpdateSetting/)

The PowerShell commands in this module are intended to make it easier to automate the process of pausing and resuming Windows Updates on a Windows 10/11 desktop as well as a few other update-related settings. __This module will not work on Windows 10 Home__. If you are running an Enterprise edition of Windows, your settings may be managed via Group Policy, in which case you won't be able to use this module.

You can install the latest version of this module from the PowerShell Gallery.

```powershell
Install-PSResource WindowsUpdateSetting
```

The module should work on PowerShell 7 running on a Windows platform.

## Command Overview

- [Get-WindowsActiveHours](docs/Get-WindowsActiveHours.md)
- [Get-WindowsUpdateDeferral](docs/Get-WindowsUpdateDeferral.md)
- [Get-WindowsUpdateSetting](docs/Get-WindowsUpdateSetting.md)
- [Resume-WindowsUpdate](docs/Resume-WindowsUpdate.md)
- [Set-WindowsActiveHours](docs/Set-WindowsActiveHours.md)
- [Set-WindowsUpdateDeferral](docs/Set-WindowsUpdateDeferral.md)
- [Suspend-WindowsUpdate](docs/Suspend-WindowsUpdate.md)
- [Test-IsWindowsUpdatePaused](docs/Test-IsWindowsUpdatePaused.md)

## Suspend and Resume Windows Updates

Normally, you would use Settings to pause Windows Update for 35 days.

![settings](assets/settings.png)

You can use this module to toggle that setting from a PowerShell prompt.

```powershell
PS C:\> Suspend-WindowsUpdate -passthru

   Computername: PROSPERO

Paused   PauseStartUTC          PauseEndUTC             TimeRemaining
------   -------------          -----------             -------------
True     3/18/2025 12:32:04 PM  4/22/2025 12:32:04 PM     35.03:59:59
```

Or you can specify a date, as long as it is less than 35 days. Use `Get-WindowsUpdateSetting` to view the current values or `Test-IsWindowsUpdatePaused` to test.

Updates should resume automatically at the end of the pause period. However, you can run `Resume-WindowsUpdate` to resume updates manually.

```powershell
Resume-WindowsUpdate
```

## Configure Active Hours

This module also contains commands to set your active hours.

![set active hours](assets/activehours.png)

```powershell
PS C:\> Get-WindowsActiveHours

Computername         Start        End
------------         -----        ---
PROSPERO          06:00 AM   11:00 PM


PS C:\> Set-WindowsActiveHours -StartTime 8:00 -EndTime 20:00 -Passthru

Computername         Start        End
------------         -----        ---
PROSPERO          08:00 AM   08:00 PM
```

## Configure Update Deferral

The module also contains commands to manage deferrals of certain updates.

![deferrals](assets/deferrals.png)

You can view and modify these settings.

```powershell
PS C:\> Get-WindowsUpdateDeferral

Computername FeatureUpdateDeferral QualityUpdateDeferral
------------ --------------------- ---------------------
PROSPERO     undefined             undefined
```

Use `Set-WindowsUpdateDeferral` to set the deferral values. You can use `-Feature` and `-Quality` to set the number of days to defer feature and quality updates, respectively.

```powershell
PS C:\> Set-WindowsUpdateDeferral -Feature 30 -Quality 7 -Passthru

Computername FeatureUpdateDeferral QualityUpdateDeferral
------------ --------------------- ---------------------
PROSPERO                        30                     7
```

**You should test all of these commands on a non-production system.**

