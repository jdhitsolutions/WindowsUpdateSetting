if ($ISWindows -or $PSEdition -eq 'Desktop') {
    Get-ChildItem -path $PSScriptRoot\functions\*.ps1 |
    ForEach-Object {
        . $_.FullName
    }
}
else {
    #get the module name
    $ModuleName = $MyInvocation.MyCommand.Name.split(".")[0]
    Write-Warning "The $ModuleName module requires a Windows platform."
}