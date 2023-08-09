---
external help file: WindowsUpdateSetting-help.xml
Module Name: WindowsUpdateSetting
online version: https://bit.ly/3DQf7Wb
schema: 2.0.0
---

# Suspend-WindowsUpdate

## SYNOPSIS

Pause Windows Updates for 35 days or less.

## SYNTAX

```yaml
Suspend-WindowsUpdate [-Resume <DateTime>] [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

This command achieves the same result as pausing Windows Updates in Settings/Windows Update/Advanced Settings.
By default your system will not check or get any updates for 35 days. But you can specify a date that is less than 35 days.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\> Suspend-WindowsUpdates
```

### EXAMPLE 2

```powershell
PS C:\> Suspend-WindowsUpdate -passthru

   Computername: PROSPERO

Paused   PauseStartUTC          PauseEndUTC             TimeRemaining
------   -------------          -----------             -------------
True     8/9/2023 8:27:34 PM    9/13/2023 8:27:34 PM      35.03:59:59
```

### EXAMPLE 3

```powershell
PS C:\> Suspend-WindowsUpdate -Resume (Get-Date).AddDays(10)
```

Suspend Windows Updates for about 10 days.

## PARAMETERS

### -Passthru

Display the current update settings.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

### -Resume

Enter a datetime to resume updates. This must be less than 35 days.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 35 days from now
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### None

### WindowsUpdateSetting

## NOTES

Learn more about PowerShell:
http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Resume-WindowsUpdate](Resume-WindowsUpdate.md)
