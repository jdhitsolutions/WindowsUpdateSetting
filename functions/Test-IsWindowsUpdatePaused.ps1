Function Test-IsWindowsUpdatePaused {
    [CmdletBinding()]
    [OutputType([boolean])]

    Param()

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"

    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"
    Try {
        [void](Get-ItemProperty -Path $base1 -Name PauseFeatureUpdatesStartTime -ErrorAction stop)
        $True
    }
    Catch {
        $False
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}
