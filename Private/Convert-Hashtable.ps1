function Convert-Hashtable {
    <#
    .SYNOPSIS
    Converts a hashtable to a string representation for PowerShell data files.

    .PARAMETER Object
    The hashtable to convert.

    .PARAMETER indent
    The level of indentation for formatting.

    .PARAMETER SkipIndentOnce
    A switch that skips indentation for the first line.

    .EXAMPLE
    $hash = @{Name = 'Test'; Value = 123}
    Convert-Hashtable -Object $hash -indent 1

    Returns a formatted hashtable string.

    #>

    param (
        [hashtable]$Object,
        [int]$indent = 0,
        [switch]$SkipIndentOnce
    )

    $out = ""

    if ($SkipIndentOnce) {
        $out += Get-IndentedString "@{`n" -indent 0
    }
    else {
        $out += Get-IndentedString "@{`n" -indent $indent
    }

    $indent += 1

    foreach ($key in $Object.Keys) {
        $out += Convert-Element -Object $key -indent $indent
        $out += " = "
        $out += Convert-Element -Object $Object[$key] -indent $indent -SkipIndentOnce
        $out += "`n"
    }

    $indent -= 1
    $out += Get-IndentedString "}" -indent $indent
    $out
}

