Function Set-WindowsUpdateDeferral {
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType("None", "WindowsUpdateDeferral")]

    Param (
        [Parameter(HelpMessage = "Enter the number of days (0-365) to defer feature updates")]
        [ValidateRange(0, 365)]
        [Int]$Feature,
        [Parameter(HelpMessage = "Enter the number of days (0-365) to defer quality updates")]
        [ValidateRange(0, 365)]
        [Int]$Quality,
        [Switch]$PassThru
    )

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)"
    $base1 = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\ux\Settings"

    if ($PSCmdlet.ShouldProcess("$env:COMPUTERNAME")) {
        if ($Feature) {
            Set-ItemProperty -Path $base1 -Name DeferFeatureUpdatesPeriodInDays -Value $Feature
        }
        if ($Quality) {
            Set-ItemProperty -Path $base1 -Name DeferQualityUpdatesPeriodInDays -Value $Quality
        }

        if ($PassThru) {
            Get-WindowsUpdateDeferral
        }
    } #should process

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
}
