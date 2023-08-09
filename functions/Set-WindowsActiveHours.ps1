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

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    #times must be 18 hours or less apart
    $ts = New-TimeSpan -start $StartTime -end $EndTime

    if ($ts.hours -gt 18 -OR $ts.hours -lt 0) {
        Write-Warning "The end time must be 18 hours or less from the start time."
        #abort and bail
        return
    }
    if ($PSCmdlet.ShouldProcess("Windows Active Hours", "Update hours: $($StartTime.hour):00 to $($endtime.hour):00")) {

        Write-Verbose "Setting start time to $($StartTime.hour):00"
        Set-ItemProperty -Path $base1 -Name ActiveHoursStart -Value $StartTime.hour -type DWord

        Write-Verbose "Setting end time to $($endTime.hour):00"
        Set-ItemProperty -Path $base1 -Name ActiveHoursEnd -Value $EndTime.hour -type DWord

        if ($PassThru) {
            Get-WindowsActiveHours
        }
    } #should process
    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"

}
