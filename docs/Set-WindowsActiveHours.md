---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version:
schema: 2.0.0
---

# Set-WindowsActiveHours

## SYNOPSIS

Configure Windows active hours.

## SYNTAX

```yaml
Set-WindowsActiveHours [-StartTime] <DateTime> [-EndTime] <DateTime> [-Passthru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION

Use this command to configure your active hours. During this time span, Windows should not restart your computer. The timespan between start and end times cannot exceed 18 hours.

## EXAMPLES

### Example 1

```powershell
PS C:\> Set-WindowsActiveHours -starttime "7:00AM" -endtime "6:00PM"
```

### Example 2

```powershell
PS C:\> Set-WindowsActiveHours -StartTime 6:00 -EndTime 21:00 -Passthru

Computername ActiveHoursStart ActiveHoursEnd
------------ ---------------- --------------
BOVINE320                   6             21
```

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

### -EndTime

Enter a ending time like 7:00PM or 19:00

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru

Display active hours

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

### -StartTime

Enter a starting time like 7:00AM or 7:00

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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

[Get-WindowsActiveHours]()