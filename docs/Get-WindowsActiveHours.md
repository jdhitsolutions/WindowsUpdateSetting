---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version: https://jdhitsolutions.com/yourls/2a97cc
schema: 2.0.0
---

# Get-WindowsActiveHours

## SYNOPSIS

Get current settings for Windows active hours.

## SYNTAX

```yaml
Get-WindowsActiveHours [<CommonParameters>]
```

## DESCRIPTION

Use this command to display the current settings for Windows active hours. Typically, Windows will not restart your computer during these hours. Hours are displayed as formatted values, but the raw property is the hour in a 24 hour format.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-WindowsActiveHours

Computername          Start        End
------------          -----        ---
WIN11DESK          06:00 AM   10:00 PM
```

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### WindowsActiveHours

## NOTES

Learn more about PowerShell: https://buttondown.com/behind-the-powershell-pipeline

## RELATED LINKS

[Set-WindowsActiveHours](Set-WindowsActiveHours.md)
