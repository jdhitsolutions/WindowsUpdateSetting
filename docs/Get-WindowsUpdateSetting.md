---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version:
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

Computername  : BOVINE320
UpdatesPaused : True
PauseStartUTC : 9/19/2018 11:13:16 PM
PauseEndUTC   : 10/24/2018 11:13:16 PM
Remaining     : 34.23:55:49.1598117
```

The settings when updates are paused.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### PSCustomObject

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Test-IsWindowsUpdatePaused]()