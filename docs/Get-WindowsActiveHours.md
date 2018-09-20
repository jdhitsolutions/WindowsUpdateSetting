---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version:
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

Use this command to display the current settings for Windows active hours. Typically, Windows will not restart your computer during these hours. Hours are display in a 24 hour format.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-WindowsActiveHours

Computername ActiveHoursStart ActiveHoursEnd
------------ ---------------- --------------
BOVINE320                   7             20
```

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Set-WindowsActiveHours]()