Function Get-WindowsActiveHours {
    [CmdletBinding()]
    [OutputType('WindowsActiveHours')]
    Param()

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    _verbose ($strings.UsingModule -f $ModuleVersion)
    _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)

    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'
    _verbose ($strings.GetSetting -f $base1)

    $start = Get-ItemPropertyValue -Path $base1 -Name ActiveHoursStart
    $end = Get-ItemPropertyValue -Path $base1 -Name ActiveHoursEnd

    [PSCustomObject]@{
        PSTypeName       = 'WindowsActiveHours'
        Computername     = $env:COMPUTERNAME
        ActiveHoursStart = $Start
        ActiveHoursEnd   = $End
    }

   _verbose $strings.Ending

}
