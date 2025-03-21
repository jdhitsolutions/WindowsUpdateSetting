---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version: https://jdhitsolutions.com/yourls/50d280
schema: 2.0.0
---

# Test-IsWindowsUpdatePaused

## SYNOPSIS

Test if Windows Updates are paused.

## SYNTAX

```yaml
Test-IsWindowsUpdatePaused [<CommonParameters>]
```

## DESCRIPTION

A simple Boolean test to determine if updates are paused on a Windows 10 or Windows 11 desktop.

## EXAMPLES

### Example 1

```powershell
PS C:\> Test-IsWindowsUpdatePaused
True
```

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

## NOTES

Learn more about PowerShell: https://buttondown.com/behind-the-powershell-pipeline

## RELATED LINKS

[Get-WindowsUpdateSetting](Get-WindowsUpdateSetting.md)
