---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version:
schema: 2.0.0
---

# Set-WindowsUpdateDeferral

## SYNOPSIS

Configure Windows update deferral settings.

## SYNTAX

```yaml
Set-WindowsUpdateDeferral [[-Feature] <Int32>] [[-Quality] <Int32>] [-Passthru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION

Advanced settings under Windows Update allow you to defer Feature and/or Quality updates for up to 365 days. Use this command to set those values from a PowerShell prompt.

## EXAMPLES

### Example 1

```powershell
PS C:\> Set-WindowsUpdateDeferral -Feature 30 -Quality 7 -Passthru

Computername FeatureUpdateDeferral QualityUpdateDeferral
------------ --------------------- ---------------------
BOVINE320                       30                     7
```

Defer feature updates for 30 days and quality updates for 7 days. This command does not write anything to the pipeline unless you use -Passthru.

## PARAMETERS

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Feature

Enter the number of days (0-365) to defer feature updates

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru

Display the current settings.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quality

Enter the number of days (0-365) to defer quality updates

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

Learn more about PowerShell: http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Get-WindowsUpdateDeferral]()