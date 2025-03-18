Function Suspend-WindowsUpdate {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType('None', 'WindowsUpdateSetting')]
    [Alias('swu')]

    Param(
        [Parameter(HelpMessage = 'Enter a date time to resume updates. This must be less than 35 days.')]
        [ValidateScript( {
                if ($_ -gt (Get-Date)) {
                    $True
                }
                else {
                    Throw 'You must enter a date in the future.'
                    $false
                }

            })]
        [ValidateScript( {
                $test = New-TimeSpan -Start (Get-Date) -End $_
                if ($test.totalDays -gt 35) {
                    Throw 'You must enter a date less than 35 days from now'
                    $False
                }
                else {
                    $True
                }
            })]
        [DateTime]$Resume = (Get-Date).AddDays(35),
        [Switch]$PassThru
    )

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    _verbose ($strings.UsingModule -f $ModuleVersion)
    _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)

    $epoch = Get-Date 1/1/1600
    $utc = (Get-Date).ToUniversalTime()
    $Start = '{0:u}' -f $utc
    $end = '{0:u}' -f $resume.ToUniversalTime()

    $ticks = ($utc - $epoch).Ticks

    $val = $ticks - $ticks % [TimeSpan]::TicksPerSecond

    _verbose ($strings.Pausing -f $end)

    if ($PSCmdlet.ShouldProcess($env:computername, "Suspend Windows Update until $Resume")) {

        $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'
        _verbose ($strings.Updating-f $base1)
        Set-ItemProperty -Path $base1 -Name PauseFeatureUpdatesStartTime -Value $start -Type String
        Set-ItemProperty -Path $base1 -Name PauseQualityUpdatesStartTime -Value $start -Type String
        Set-ItemProperty -Path $base1 -Name PauseUpdatesExpiryTime -Value $end -Type String
        Set-ItemProperty -Path $base1 -Name PauseFeatureUpdatesEndTime -Value $end -Type String
        Set-ItemProperty -Path $base1 -Name PauseQualityUpdatesEndTime -Value $end -Type String

        $base2 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings'
        _verbose ($strings.Updating -f $base1)
        Set-ItemProperty -Path $base2 -Name PausedFeatureStatus -Value 1 -type DWord  #dword 1 = on 0 = off
        Set-ItemProperty -Path $base2 -Name PausedQualityStatus -Value 1 -type DWord  #dword 1 = on 0 = off
        Set-ItemProperty -Path $Base2 -Name PausedFeatureDate -Value $val -Type QWord
        Set-ItemProperty -Path $Base2 -Name PausedQualityDate -Value $val -Type QWord

        if ($PassThru) {
            Get-WindowsUpdateSetting
        }
    }

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Ending

}
