function Get-IndentedString {
    <#
    .SYNOPSIS
    Adds indentation to a string based on the specified level.

    .PARAMETER Object
    The string to indent.

    .PARAMETER indent
    The level of indentation (in multiples of 4 spaces).

    .EXAMPLE
    Get-IndentedString 'Hello' -indent 2

    Returns "        Hello" (indented by 8 spaces).

    #>

    param (
        [string]$Object,
        [int]$indent = 0
    )
    "{0,$($indent * 4)}{1}" -f "", $Object
}