Function Get-WindowsUpdateDeferral {
    [CmdletBinding()]
    [OutputType('WindowsUpdateDeferral')]

    Param ()

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"
    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'

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

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}
