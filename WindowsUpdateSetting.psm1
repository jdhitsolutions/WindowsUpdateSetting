Import-LocalizedData -BindingVariable strings
if ($ISWindows -Or $PSEdition -eq 'Desktop') {
    Get-ChildItem -path $PSScriptRoot\functions\*.ps1 |
    ForEach-Object {
        . $_.FullName
    }

    #define a module-scoped variable for the module version
    $ModuleVersion = (Test-ModuleManifest -Path $PSScriptRoot\WindowsUpdateSetting.psd1).Version

    #a module-scoped variable for the ANSI escape sequences using in custom verbose messaging
    $VerboseAnsi = @{
        "Default" = "[93m"
    }
}
else {
    #get the module name
    $ModuleName = $MyInvocation.MyCommand.Name.split(".")[0]
    Write-Warning ($strings.RequiresWindows -f $ModuleName)
}