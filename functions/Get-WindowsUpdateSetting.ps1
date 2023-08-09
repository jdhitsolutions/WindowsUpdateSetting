Function Get-WindowsUpdateSetting {
    [CmdletBinding()]
    [OutputType('WindowsUpdateSetting')]
    [Alias('gwu')]

    Param()

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"
    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'

    $paused = Test-IsWindowsUpdatePaused

    if ($paused) {
        Write-Verbose "[$((Get-Date).TimeOfDay)] Querying $base1 for values"
        $start = ((Get-ItemPropertyValue -Path $base1 -Name PauseFeatureUpdatesStartTime) -As [DateTime]).ToUniversalTime()
        $resume = ((Get-ItemPropertyValue -Path $base1 -Name PauseFeatureUpdatesEndTime) -As [DateTime]).ToUniversalTime()
        $remain = $resume - (Get-Date)
    }
    else {
        $start = $null
        $resume = $null
        $remain = $null
    }
    [PSCustomObject]@{
        PSTypeName    = 'WindowsUpdateSetting'
        Computername  = $env:computername
        UpdatesPaused = $paused
        PauseStartUTC = $start
        PauseEndUTC   = $resume
        Remaining     = $remain
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}
