Function Resume-WindowsUpdate {

    [CmdletBinding(SupportsShouldProcess)]
    [OutputType('None', 'WindowsUpdateSetting')]
    [Alias('rwu')]

    Param([Switch]$PassThru)

    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Starting
    _verbose ($strings.UsingModule -f $ModuleVersion)
    _verbose ($strings.PSVersion -f $PSVersionTable.PSVersion)
    _verbose $strings.Testing

    if (Test-IsWindowsUpdatePaused) {
        $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
        If ($PSCmdlet.ShouldProcess($env:COMPUTERNAME)) {
            _verbose $strings.Restoring
            $base1 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings'
            _verbose ($strings.GetSetting -f $base1)
            $settings = 'PauseFeatureUpdatesStartTime', 'PauseQualityUpdatesStartTime',
            'PauseUpdatesExpiryTime', 'PauseFeatureUpdatesEndTime', 'PauseQualityUpdatesEndTime'

           _verbose ($strings.Removing -f $base1)
            foreach ($setting in $settings) {
                _verbose $setting
                Remove-ItemProperty -Path $base1 -Name $setting
            }

            $base2 = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings'
            $settings = 'PausedFeatureStatus', 'PausedQualityStatus'
            _verbose ($strings.Updating -f $base2)

            foreach ($setting in $settings) {
                _verbose $setting
                Set-ItemProperty -Path $base2 -Name $setting -Value 0 -type DWord  #dword 1 = on 0 = off
            }

            $settings = 'PausedFeatureDate', 'PausedQualityDate'
            _verbose ($strings.Removing -f $base2)

            foreach ($setting in $settings) {
                _verbose $setting
                Remove-ItemProperty -Path $base2 -Name $setting
            }

            if ($PassThru) {
                Get-WindowsUpdateSetting
            }
        } #should process
    } #if paused
    else {
        Write-Host $strings.Enabled -ForegroundColor green
    }
    $PSDefaultParameterValues["_verbose:Command"] = $MyInvocation.MyCommand
    _verbose $strings.Ending

}
