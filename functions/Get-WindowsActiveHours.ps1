Function Get-WindowsActiveHours {
    [CmdletBinding()]
    [OutputType('WindowsActiveHours')]
    Param()

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"

    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'

    $start = Get-ItemPropertyValue -Path $base1 -Name ActiveHoursStart
    $end = Get-ItemPropertyValue -Path $base1 -Name ActiveHoursEnd

    [PSCustomObject]@{
        PSTypeName       = 'WindowsActiveHours'
        Computername     = $env:COMPUTERNAME
        ActiveHoursStart = $Start
        ActiveHoursEnd   = $End
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"

}
