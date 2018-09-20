---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version:
schema: 2.0.0
---

# Get-WindowsUpdateDeferral

## SYNOPSIS

Get current Windows update deferral settings.

## SYNTAX

```yaml
Get-WindowsUpdateDeferral [<CommonParameters>]
```

## DESCRIPTION

Get the current settings for deferring Windows feature or quality updates.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-WindowsUpdateDeferral

Computername FeatureUpdateDeferral QualityUpdateDeferral
------------ --------------------- ---------------------
BOVINE320                       30                     7
```

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### WindowsUpdateDeferral

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Set-WindowsUpdateDeferral]()
