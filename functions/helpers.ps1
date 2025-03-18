#private helper functions

#my private Verbose function

function _verbose {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string]$Message,
        [string]$Block = 'PROCESS',
        [string]$Command
    )

    #Display each command name in a different color sequence
    #if defined
    if ($script:VerboseANSI.ContainsKey($Command)) {
        [string]$ANSI = $script:VerboseANSI[$Command]
    }
    else {
        [string]$ANSI = $script:VerboseANSI['DEFAULT']
    }

    $BlockString = $Block.ToUpper().PadRight(7, ' ')
    $Reset = "$([char]27)[0m"
    $ToD = (Get-Date).TimeOfDay
    $AnsiCommand = "$([char]27)$ANSI$($command)"
    $Italic = "$([char]27)[3m"
    if ($Host.Name -eq 'Windows PowerShell ISE Host') {
        $msg = '[{0:hh\:mm\:ss\:ffff} {1}] {2}-> {3}' -f $Tod, $BlockString, $Command, $Message
    }
    else {
        $msg = '[{0:hh\:mm\:ss\:ffff} {1}] {2}{3}-> {4} {5}{3}' -f $Tod, $BlockString, $AnsiCommand, $Reset, $Italic, $Message
    }
    #use the built-in Write-Verbose cmdlet
    Microsoft.PowerShell.Utility\Write-Verbose -Message $msg

}