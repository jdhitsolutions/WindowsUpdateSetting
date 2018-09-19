#requires -version 5.1

#region main code

Function Suspend-WindowsUpdate {

    [CmdletBinding(SupportsShouldProcess)]
    [OutputType("None")]

    Param([switch]$Passthru)

    Write-Verbose "Starting $($MyInvocation.Mycommand)"

    $epoch = Get-Date 1/1/1600
    $utc = (Get-Date).ToUniversalTime()
    $Start = "{0:u}" -f $utc
    $End = "{0:u}" -f $utc.AddDays(35)

    $ticks = ($utc - $epoch).Ticks

    $val = $ticks - $ticks % [timespan]::TicksPerSecond

    Write-Verbose "Pausing Windows Updates until $end"

    if ($pscmdlet.ShouldProcess($env:computername)) {

        $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"
        Set-ItemProperty -Path $base1 -Name PauseFeatureUpdatesStartTime -Value $start -Type String
        Set-ItemProperty -Path $base1 -Name PauseQualityUpdatesStartTime -Value $start -Type String
        Set-ItemProperty -Path $base1 -Name PauseUpdatesExpiryTime -Value $end -Type String
        Set-ItemProperty -Path $base1 -Name PauseFeatureUpdatesEndTime -Value $end -Type String
        Set-ItemProperty -Path $base1 -Name PauseQualityUpdatesEndTime -Value $end -Type String

        $base2 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings"
        Set-ItemProperty -path $base2 -name PausedFeatureStatus -value 1 -type DWord  #dword 1 = on 0 = off
        Set-ItemProperty -path $base2 -name PausedQualityStatus -value 1 -type DWord  #dword 1 = on 0 = off
        Set-ItemProperty -path $Base2 -name PausedFeatureDate -value $val -Type QWord
        Set-ItemProperty -path $Base2 -name PausedQualityDate -value $val -Type QWord

        if ($passthru) {
            Get-WindowsUpdateSetting
        }
    }

    Write-Verbose "Ending $($MyInvocation.Mycommand)"

} #close function

Function Resume-WindowsUpdate {

    [CmdletBinding(SupportsShouldProcess)]
    [OutputType("None")]

    Param([switch]$Passthru)

    Write-Verbose "Starting $($MyInvocation.Mycommand)"

    Write-Verbose "Testing if Windows Update is paused"

    if (Test-IsWindowsUpdatePaused) {

        If ($pscmdlet.ShouldProcess($env:COMPUTERNAME)) {
            Write-Verbose "Restoring Windows Update Settings"
            $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

            $settings = 'PauseFeatureUpdatesStartTime', 'PauseQualityUpdatesStartTime',
            'PauseUpdatesExpiryTime', 'PauseFeatureUpdatesEndTime', 'PauseQualityUpdatesEndTime'

            Write-Verbose "Removing registry values from $base1"
            foreach ($setting in $settings) {
                Write-Verbose "..$setting"
                Remove-ItemProperty -Path $base1 -Name $setting
            }

            $base2 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings"
            $settings = 'PausedFeatureStatus', 'PausedQualityStatus'
            Write-Verbose "Updating registry values from $base2"

            foreach ($setting in $settings) {
                Write-Verbose "..$setting"
                Set-ItemProperty -path $base2 -name $setting -value 0 -type DWord  #dword 1 = on 0 = off
            }

            $settings = 'PausedFeatureDate', 'PausedQualityDate'
            Write-Verbose "Removing registry values from $base2"
            foreach ($setting in $settings) {
                Write-Verbose "..$setting"
                Remove-ItemProperty -Path $base2 -Name $setting
            }

            if ($passthru) {
                Get-WindowsUpdateSetting
            }
        } #should process
    } #if paused
    else {
        Write-Host "Windows Updates are already enabled" -ForegroundColor green
    }

    Write-Verbose "Ending $($MyInvocation.Mycommand)"

} #close function

Function Test-IsWindowsUpdatePaused {

    [cmdletbinding()]
    [OutputType([boolean])]

    Param()

    Write-Verbose "Starting $($MyInvocation.Mycommand)"

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"
    Try {
        [void](Get-ItemProperty -Path $base1 -Name PauseFeatureUpdatesStartTime -ErrorAction stop)
        $True
    }
    Catch {
        $False
    }

    Write-Verbose "Ending $($MyInvocation.Mycommand)"
}

Function Get-WindowsUpdateSetting {

    [CmdletBinding()]
    [OutputType([PSCustomObject])]

    Param()

    Write-Verbose "Starting $($MyInvocation.Mycommand)"
    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    $paused = Test-IsWindowsUpdatePaused
    if ($paused) {
        $start = (Get-ItemPropertyValue -Path $base1 -Name PauseFeatureUpdatesStartTime) -As [datetime]
        $resume = (Get-ItemPropertyValue -Path $base1 -Name PauseFeatureUpdatesEndTime) -As [datetime]
        $remain = $resume - (Get-Date)
    }
    else {
        $start = $null
        $resume = $null
        $remain = $null
    }
    [pscustomobject]@{
        Computername  = $env:computername
        UpdatesPaused = $paused
        PauseStartUTC = $start.ToUniversalTime()
        PauseEndUTC   = $resume.ToUniversalTime()
        Remaining     = $remain
    }

    Write-Verbose "Ending $($MyInvocation.Mycommand)"
}

#endregion

