---
external help file: WindowsUpdateSetting-help.xml
Module Name: windowsupdatesetting
online version:
schema: 2.0.0
---

# Suspend-WindowsUpdate

## SYNOPSIS

Pause Windows Updates for 35 days.

## SYNTAX

```yaml
Suspend-WindowsUpdate [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

This command achieves the same result as pausing Windows Updates in Settings/Windows Update/Advanced Settings.
Your system will not check or get any updates for 35 days.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\> Suspend-WindowsUpdates
```

### EXAMPLE 2

```powershell
PS C:\> Suspend-WindowsUpdate -Passthru


Computername  : BOVINE320
UpdatesPaused : True
PauseStartUTC : 9/19/2018 11:13:16 PM
PauseEndUTC   : 10/24/2018 11:13:16 PM
Remaining     : 34.23:59:59.6602540
```

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### None

## NOTES

Learn more about PowerShell:
http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Resume-WindowsUpdate]()

