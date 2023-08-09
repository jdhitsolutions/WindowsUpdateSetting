#
# Module manifest for WindowsUpdateSetting
#

@{
    RootModule           = 'WindowsUpdateSetting.psm1'
    ModuleVersion        = '1.0.0'
    CompatiblePSEditions = @('Desktop', 'Core')
    GUID                 = '1d09501c-fc3f-424a-9fb9-c2a5d6f59001'
    Author               = 'Jeff Hicks'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '(c) 2018-2023 Jeff Hicks. All rights reserved.'
    Description          = 'A set of PowerShell functions to managing Windows Update settings such as pausing, on Windows 10 or Windows 11. This module should work in Windows PowerShell and PowerShell 7 on a Windows platform.'
    PowerShellVersion    = '5.1'
    FunctionsToExport    = @(
        'Suspend-WindowsUpdate',
        'Resume-WindowsUpdate',
        'Get-WindowsUpdateSetting',
        'Test-IsWindowsUpdatePaused',
        'Set-WindowsActiveHours',
        'Get-WindowsActiveHours',
        'Get-WindowsUpdateDeferral',
        'Set-WindowsUpdateDeferral'
    )
    FormatsToProcess = @('formats\windowsactivehours.format.ps1xml','formats\windowsupdatesetting.format.ps1xml')
    CmdletsToExport      = ''
    AliasesToExport      = 'rwu', 'swu', 'gwu'
    PrivateData          = @{
        PSData = @{
            Tags       = @('Windows10', 'Windows11','WindowsUpdate','ActiveHours','UpdateDeferral')
            LicenseUri = 'https://github.com/jdhitsolutions/WindowsUpdateSetting/blob/master/license.txt'
            ProjectUri = 'https://github.com/jdhitsolutions/WindowsUpdateSetting'
            IconUri    = 'https://github.com/jdhitsolutions/WindowsUpdateSetting/blob/master/assets/windows10.ico'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}