Function Get-WindowsUpdateSetting {
    [CmdletBinding()]
    [OutputType('WindowsUpdateSetting')]
    [Alias('gwu')]

    Param()

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    if ($MyInvocation.CommandOrigin -eq 'Runspace') {
        #Hide this metadata when the command is called from another command
        _verbose ($strings.UsingModule -f $ModuleVersion)
        _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)
    }
    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'
    _verbose ($strings.GetSetting -f $base1)
    $paused = Test-IsWindowsUpdatePaused

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand

    if ($paused) {
       _verbose ($strings.Query -f $base1)
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

    _verbose $strings.Ending
}
