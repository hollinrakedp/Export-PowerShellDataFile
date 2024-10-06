function Convert-Int {
    <#
    .SYNOPSIS
    Converts an integer to a string representation for PowerShell data files.

    .PARAMETER Object
    The integer to convert.

    .PARAMETER indent
    The level of indentation for formatting.

    .PARAMETER SkipIndentOnce
    A switch that skips indentation for the first line.

    .EXAMPLE
    Convert-Int -Object 123

    Returns "123".

    #>

    param (
        [int]$Object,
        [int]$indent = 0,
        [switch]$SkipIndentOnce
    )

    if ($SkipIndentOnce) {
        Get-IndentedString "$Object" -indent 0
    }
    else {
        Get-IndentedString "$Object" -indent $indent
    }
}

