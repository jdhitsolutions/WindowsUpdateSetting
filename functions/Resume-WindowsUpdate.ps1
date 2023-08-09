Function Resume-WindowsUpdate {

    [CmdletBinding(SupportsShouldProcess)]
    [OutputType('None', 'WindowsUpdateSetting')]
    [Alias('rwu')]

    Param([Switch]$PassThru)

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"
    Write-Verbose "[$((Get-Date).TimeOfDay)] Testing if Windows Update is paused"

    if (Test-IsWindowsUpdatePaused) {
        If ($PSCmdlet.ShouldProcess($env:COMPUTERNAME)) {
            Write-Verbose "[$((Get-Date).TimeOfDay)] Restoring Windows Update Settings"
            $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'

            $settings = 'PauseFeatureUpdatesStartTime', 'PauseQualityUpdatesStartTime',
            'PauseUpdatesExpiryTime', 'PauseFeatureUpdatesEndTime', 'PauseQualityUpdatesEndTime'

            Write-Verbose "[$((Get-Date).TimeOfDay)] Removing registry values from $base1"
            foreach ($setting in $settings) {
                Write-Verbose "[$((Get-Date).TimeOfDay)] ..$setting"
                Remove-ItemProperty -Path $base1 -Name $setting
            }

            $base2 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings'
            $settings = 'PausedFeatureStatus', 'PausedQualityStatus'
            Write-Verbose "[$((Get-Date).TimeOfDay)] Updating registry values from $base2"

            foreach ($setting in $settings) {
                Write-Verbose "[$((Get-Date).TimeOfDay)] ..$setting"
                Set-ItemProperty -Path $base2 -Name $setting -Value 0 -type DWord  #dword 1 = on 0 = off
            }

            $settings = 'PausedFeatureDate', 'PausedQualityDate'
            Write-Verbose "[$((Get-Date).TimeOfDay)] Removing registry values from $base2"
            foreach ($setting in $settings) {
                Write-Verbose "[$((Get-Date).TimeOfDay)] ..$setting"
                Remove-ItemProperty -Path $base2 -Name $setting
            }

            if ($PassThru) {
                Get-WindowsUpdateSetting
            }
        } #should process
    } #if paused
    else {
        Write-Host 'Windows Updates are already enabled' -ForegroundColor green
    }

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"

}
