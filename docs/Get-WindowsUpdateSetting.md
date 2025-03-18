---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version: https://jdhitsolutions.com/yourls/c7d249
schema: 2.0.0
---

# Get-WindowsUpdateSetting

## SYNOPSIS

Get the current Windows Update settings.

## SYNTAX

```yaml
Get-WindowsUpdateSetting [<CommonParameters>]
```

## DESCRIPTION

Display the current values for any paused Windows Update settings.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-WindowsUpdateSetting

   Computername: PROSPERO

Paused   PauseStartUTC          PauseEndUTC             TimeRemaining
------   -------------          -----------             -------------
True     3/18/2025 1:42:20 PM   4/22/2025 1:42:20 PM      35.03:59:55
```

The settings when updates are paused.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### WindowsUpdateSetting

## NOTES

Learn more about PowerShell: https://buttondown.com/behind-the-powershell-pipeline

## RELATED LINKS

[Test-IsWindowsUpdatePaused](Test-IsWindowsUpdatePaused.md)
