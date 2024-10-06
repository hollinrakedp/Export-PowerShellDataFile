function Convert-String {
    <#
    .SYNOPSIS
    Converts a string to a quoted string representation for PowerShell data files.

    .PARAMETER Object
    The string to convert.

    .PARAMETER indent
    The level of indentation for formatting.

    .PARAMETER SkipIndentOnce
    A switch that skips indentation for the first line.

    .EXAMPLE
    Convert-String -Object 'Test'

    Returns "'Test'".

    #>

    param (
        [string]$Object,
        [int]$indent = 0,
        [switch]$SkipIndentOnce
    )

    if ($SkipIndentOnce) {
        Get-IndentedString "`"$Object`"" -indent 0
    }
    else {
        Get-IndentedString "`"$Object`"" -indent $indent
    }
}

