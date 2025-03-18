Function Set-WindowsActiveHours {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType("None", "WindowsActiveHours")]

    Param(
        [Parameter(Mandatory, HelpMessage = "Enter a starting time like 7:00AM")]
        [DateTime]$StartTime,
        [Parameter(Mandatory, HelpMessage = "Enter a ending time like 7:00PM")]
        [DateTime]$EndTime,
        [Switch]$PassThru
    )

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    _verbose ($strings.UsingModule -f $ModuleVersion)
    _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"
    _verbose ($strings.SetSetting -f $base1)
    #times must be 18 hours or less apart
    $ts = New-TimeSpan -start $StartTime -end $EndTime

    if ($ts.hours -gt 18 -OR $ts.hours -lt 0) {
        Write-Warning $strings.TimeWarning
        #abort and bail
        return
    }
    if ($PSCmdlet.ShouldProcess("Windows Active Hours", "Update hours: $($StartTime.hour):00 to $($endtime.hour):00")) {

        _verbose ($strings.SetStart -f "$($StartTime.hour):00")
        Set-ItemProperty -Path $base1 -Name ActiveHoursStart -Value $StartTime.hour -type DWord

        _verbose ($strings.SetEnd -f "$($endTime.hour):00")
        Set-ItemProperty -Path $base1 -Name ActiveHoursEnd -Value $EndTime.hour -type DWord

        if ($PassThru) {
            Get-WindowsActiveHours
        }
    } #should process

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Ending

}
