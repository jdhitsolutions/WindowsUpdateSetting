#requires -version 5.1


#region main code
Function Set-WindowsUpdateDeferral {
    [cmdletbinding(SupportsShouldProcess)]
    [OutputType("None", "WindowsUpdateDeferral")]

    Param (
        [Parameter(HelpMessage = "Enter the number of days (0-365) to defer feature updates")]
        [ValidateRange(0, 365)]
        [int]$Feature,
        [Parameter(HelpMessage = "Enter the number of days (0-365) to defer quality updates")]
        [ValidateRange(0, 365)]
        [int]$Quality,
        [switch]$Passthru
    )

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($myinvocation.mycommand)"
    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    if ($PSCmdlet.ShouldProcess("$env:COMPUTERNAME")) {
        if ($Feature) {
            Set-ItemProperty -Path $base1 -Name DeferFeatureUpdatesPeriodInDays -Value $Feature
        }
        if ($Quality) {
            Set-ItemProperty -Path $base1 -Name DeferQualityUpdatesPeriodInDays -Value $Quality
        }

        if ($Passthru) {
            Get-WindowsUpdateDeferral
        }
    } #should process

    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($myinvocation.mycommand)"
}
Function Get-WindowsUpdateDeferral {
    [cmdletbinding()]
    [OutputType("WindowsUpdateDeferral")]

    Param ()

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($myinvocation.mycommand)"
    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    $feature = Get-ItemPropertyValue -Path $base1 -Name DeferFeatureUpdatesPeriodInDays
    $Quality = Get-ItemPropertyValue -Path $base1 -Name DeferQualityUpdatesPeriodInDays

    $obj = [PSCustomObject]@{
        Computername          = $env:COMPUTERNAME
        FeatureUpdateDeferral = $Feature
        QualityUpdateDeferral = $Quality
    }

    $obj.psobject.typenames.insert(0, 'WindowsUpdateDeferral')
    $obj
    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($myinvocation.mycommand)"
}
Function Set-WindowsActiveHours {
    [cmdletbinding(SupportsShouldProcess)]
    [OutputType("None", "WindowsActiveHours")]

    Param(
        [Parameter(Mandatory, HelpMessage = "Enter a starting time like 7:00AM")]
        [datetime]$StartTime,
        [Parameter(Mandatory, HelpMessage = "Enter a ending time like 7:00PM")]
        [datetime]$EndTime,
        [switch]$Passthru
    )

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($myinvocation.mycommand)"

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    #times must be 18 hours or less apart
    $ts = New-Timespan -start $startTime -end $EndTime

    if ($ts.hours -gt 18 -OR $ts.hours -lt 0) {
        Write-Warning "The end time must be 18 hours or less from the start time."
        #abort and bail
        return
    }
    if ($PSCmdlet.ShouldProcess("Windows Active Hours", "Update hours: $($starttime.hour):00 to $($endtime.hour):00")) {

        Write-Verbose "Setting start time to $($startTime.hour):00"
        Set-ItemProperty -Path $base1 -Name ActiveHoursStart -Value $starttime.hour -type DWord

        Write-Verbose "Setting end time to $($endTime.hour):00"
        Set-ItemProperty -Path $base1 -Name ActiveHoursEnd -Value $EndTime.hour -type DWord

        if ($passthru) {
            Get-WindowsActiveHours
        }
    } #should process
    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($myinvocation.mycommand)"

} #close Set-WindowsActiveHours
Function Get-WindowsActiveHours {
    [cmdletbinding()]
    [OutputType('WindowsActiveHours')]

    Param()

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($myinvocation.mycommand)"

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    $start = Get-ItemPropertyValue -Path $base1 -Name ActiveHoursStart
    $end = Get-ItemPropertyValue -Path $base1 -Name ActiveHoursEnd

    $obj = [PSCustomObject]@{
        Computername     = $env:COMPUTERNAME
        ActiveHoursStart = $start
        ActiveHoursEnd   = $end
    }

    $obj.psobject.typenames.insert(0, 'WindowsActiveHours')
    $obj

    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($myinvocation.mycommand)"

} #close Get-WindowsActiveHours
Function Suspend-WindowsUpdate {

    [CmdletBinding(SupportsShouldProcess)]
    [OutputType("None", "WindowsUpdateSetting")]
    [Alias("swu")]

    Param(
        [Parameter(HelpMessage = "Enter a datetime to resume updates. This must be less than 35 days.")]
        [ValidateScript( {
                if ($_ -gt (Get-Date)) {
                    $True
                }
                else {
                    Throw "You must enter a date in the future."
                    $false
                }

            })]
        [ValidateScript( {
                $test = New-Timespan -Start (Get-Date) -end $_
                if ($test.totalDays -gt 35) {
                    Throw "You must enter a date less than 35 days from now"
                    $False
                }
                else {
                    $True
                }
            })]
        [datetime]$Resume = (Get-Date).AddDays(35),
        [switch]$Passthru
    )

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($MyInvocation.Mycommand)"

    $epoch = Get-Date 1/1/1600
    $utc = (Get-Date).ToUniversalTime()
    $Start = "{0:u}" -f $utc
    $end = "{0:u}" -f $resume.ToUniversalTime()

    $ticks = ($utc - $epoch).Ticks

    $val = $ticks - $ticks % [timespan]::TicksPerSecond

    Write-Verbose "[$((Get-Date).TimeofDay)] Pausing Windows Updates until $end"

    if ($pscmdlet.ShouldProcess($env:computername, "Suspend Windows Update until $Resume")) {

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

    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($MyInvocation.Mycommand)"

} #close function
Function Resume-WindowsUpdate {

    [CmdletBinding(SupportsShouldProcess)]
    [OutputType("None", "WindowsUpdateSetting")]
    [Alias("rwu")]

    Param([switch]$Passthru)

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($MyInvocation.Mycommand)"

    Write-Verbose "[$((Get-Date).TimeofDay)] Testing if Windows Update is paused"

    if (Test-IsWindowsUpdatePaused) {

        If ($pscmdlet.ShouldProcess($env:COMPUTERNAME)) {
            Write-Verbose "[$((Get-Date).TimeofDay)] Restoring Windows Update Settings"
            $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

            $settings = 'PauseFeatureUpdatesStartTime', 'PauseQualityUpdatesStartTime',
            'PauseUpdatesExpiryTime', 'PauseFeatureUpdatesEndTime', 'PauseQualityUpdatesEndTime'

            Write-Verbose "[$((Get-Date).TimeofDay)] Removing registry values from $base1"
            foreach ($setting in $settings) {
                Write-Verbose "[$((Get-Date).TimeofDay)] ..$setting"
                Remove-ItemProperty -Path $base1 -Name $setting
            }

            $base2 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings"
            $settings = 'PausedFeatureStatus', 'PausedQualityStatus'
            Write-Verbose "[$((Get-Date).TimeofDay)] Updating registry values from $base2"

            foreach ($setting in $settings) {
                Write-Verbose "[$((Get-Date).TimeofDay)] ..$setting"
                Set-ItemProperty -path $base2 -name $setting -value 0 -type DWord  #dword 1 = on 0 = off
            }

            $settings = 'PausedFeatureDate', 'PausedQualityDate'
            Write-Verbose "[$((Get-Date).TimeofDay)] Removing registry values from $base2"
            foreach ($setting in $settings) {
                Write-Verbose "[$((Get-Date).TimeofDay)] ..$setting"
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

    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($MyInvocation.Mycommand)"

} #close function
Function Test-IsWindowsUpdatePaused {

    [cmdletbinding()]
    [OutputType([boolean])]

    Param()

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($MyInvocation.Mycommand)"

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"
    Try {
        [void](Get-ItemProperty -Path $base1 -Name PauseFeatureUpdatesStartTime -ErrorAction stop)
        $True
    }
    Catch {
        $False
    }

    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($MyInvocation.Mycommand)"
}
Function Get-WindowsUpdateSetting {

    [CmdletBinding()]
    [OutputType('WindowsUpdateSetting')]
    [Alias("gwu")]

    Param()

    Write-Verbose "[$((Get-Date).TimeofDay)] Starting $($MyInvocation.Mycommand)"
    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    $paused = Test-IsWindowsUpdatePaused

    if ($paused) {
        Write-Verbose "[$((Get-Date).TimeofDay)] Querying $base1 for values"
        $start = ((Get-ItemPropertyValue -Path $base1 -Name PauseFeatureUpdatesStartTime) -As [datetime]).ToUniversalTime()
        $resume = ((Get-ItemPropertyValue -Path $base1 -Name PauseFeatureUpdatesEndTime) -As [datetime]).ToUniversalTime()
        $remain = $resume - (Get-Date)
    }
    else {
        $start = $null
        $resume = $null
        $remain = $null
    }
    $obj = [pscustomobject]@{
        Computername  = $env:computername
        UpdatesPaused = $paused
        PauseStartUTC = $start
        PauseEndUTC   = $resume
        Remaining     = $remain
    }

    $obj.psobject.typenames.insert(0, 'WindowsUpdateSetting')
    $obj

    Write-Verbose "[$((Get-Date).TimeofDay)] Ending $($MyInvocation.Mycommand)"
}

#endregion

