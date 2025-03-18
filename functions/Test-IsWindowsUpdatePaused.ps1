Function Test-IsWindowsUpdatePaused {
    [CmdletBinding()]
    [OutputType([boolean])]

    Param()

    $PSDefaultParameterValues['_verbose:Command'] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    if ($MyInvocation.CommandOrigin -eq 'Runspace') {
        #Hide this metadata when the command is called from another command
        _verbose ($strings.UsingModule -f $ModuleVersion)
        _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)
    }
    $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'
    Try {
        [void](Get-ItemProperty -Path $base1 -Name PauseFeatureUpdatesStartTime -ErrorAction stop)
        $True
    }
    Catch {
        $False
    }

    _verbose $strings.Ending
}
