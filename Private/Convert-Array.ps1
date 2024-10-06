function Convert-Array {
    <#
    .SYNOPSIS
    Converts an array to a string representation for PowerShell data files.

    .PARAMETER Object
    The array to convert.

    .PARAMETER indent
    The level of indentation for formatting.

    .PARAMETER SkipIndentOnce
    A switch that skips indentation for the first line.

    .EXAMPLE   
    Convert-Array -Object @('Item1', 'Item2') -indent 1

    #>

    param (
        $Object,
        [int]$indent = 0,
        [switch]$SkipIndentOnce
    )

    $out = ""

    if ($SkipIndentOnce) {
        $out += Get-IndentedString "@(`n" -indent 0
    }
    else {
        $out += Get-IndentedString "@(`n" -indent $indent
    }

    foreach ($elem in $Object) {
        $out += Convert-Element -Object $elem -indent ($indent + 1)
        $out += "`n"
    }

    $out += Get-IndentedString ")" -indent $indent
    $out
}
