function Convert-Element {
    <#
    .SYNOPSIS
    Converts an element to its appropriate representation based on its type.

    .PARAMETER Object
    The object to convert. Supports arrays, hashtables, integers, and strings.

    .PARAMETER indent
    The level of indentation for formatting.

    .PARAMETER SkipIndentOnce
    A switch that skips indentation for the first line.

    .EXAMPLE
    Convert-Element -Object @('Item1', 'Item2')

    #>

    param (
        $Object,
        [int]$indent = 0,
        [switch]$SkipIndentOnce
    )

    $SplatObject = @{
        Object    = $Object
        indent = $indent
    }

    if ($SkipIndentOnce) {
        $SplatObject["SkipIndentOnce"] = $true
    }

    switch -Regex ($Object.GetType().Name) {
        "Object\[\]" {return Convert-Array @SplatObject}
        "Hashtable" {return Convert-Hashtable @SplatObject}
        'Int\d+' {return Convert-Int @SplatObject}
        default {return Convert-String @SplatObject}
    }
}
