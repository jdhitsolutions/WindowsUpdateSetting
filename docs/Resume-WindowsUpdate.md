---
external help file: WindowsUpdateSetting-help.xml
Module Name: windowsupdatesetting
online version:
schema: 2.0.0
---

# Resume-WindowsUpdate

## SYNOPSIS

Resume Windows Updates

## SYNTAX

```yaml
Resume-WindowsUpdate [-Passthru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

This command achieves the same result as un-pausing Windows Updates in Settings/Windows Update/Advanced Settings. Your system will resume checking and installing updates as configured.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\> Resume-WindowsUpdates
```

Restore Windows Update settings. This is the same as "un-pausing".

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

### PSCustomObject

## NOTES

Learn more about PowerShell:
http://jdhitsolutions.com/blog/essential-powershell-resources/

## RELATED LINKS

[Suspend-WindowsUpdate]()

