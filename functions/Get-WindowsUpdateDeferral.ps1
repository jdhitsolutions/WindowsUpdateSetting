Function Get-WindowsUpdateDeferral {
    [CmdletBinding()]
    [OutputType('WindowsUpdateDeferral')]

    Param ()

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    _verbose ($strings.UsingModule -f $ModuleVersion)
    _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)
    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'
    _verbose ($strings.GetSetting -f $base1)
    Try {
        $feature = Get-ItemPropertyValue -Path $base1 -Name DeferFeatureUpdatesPeriodInDays -ErrorAction Stop
    }
    Catch {
        $feature = "undefined"
    }
    Try {
        $Quality = Get-ItemPropertyValue -Path $base1 -Name DeferQualityUpdatesPeriodInDays -ErrorAction Stop
    }
    Catch {
        $Quality = "undefined"
    }
    [PSCustomObject]@{
        PSTypeName            = 'WindowsUpdateDeferral'
        Computername          = $env:COMPUTERNAME
        FeatureUpdateDeferral = $Feature
        QualityUpdateDeferral = $Quality
    }

    _verbose $strings.Ending
}
