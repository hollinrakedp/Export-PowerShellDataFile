function Export-PowerShellDataFile {
    <#
    .SYNOPSIS
    Exports an object to a PowerShell data file (psd1 format).

    .DESCRIPTION
    Converts the provided object to the appropriate format and exports it to a psd1 file.
    If a path is specified, the object is saved to that file. Otherwise, the converted
    object is written to the output. Prevents overwriting an existing file if -NoClobber is used.

    .PARAMETER Object
    The object to be exported. Can be piped or passed by property name.

    .PARAMETER Path
    The path where the psd1 file will be saved. If omitted, the output will be written to the console.

    .PARAMETER NoClobber
    A switch to prevent overwriting an existing file. If set and the file already exists, an error will be thrown.

    .EXAMPLE
    $data = @{Name = 'Test'; Value = 123}
    $data | Export-PowerShellDataFile -Path 'C:\temp\data.psd1'
        
    This will export the hashtable to the specified path as a psd1 file.

    .EXAMPLE
    $data = @{Name = 'Test'; Value = 123}
    Export-PowerShellDataFile -Object $data -NoClobber -Path 'C:\temp\data.psd1'
        
    This will export the hashtable to the specified path but will throw an error if the file already exists.

    #>

    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        $Object,
        [string]$Path,
        [switch]$NoClobber
    )

    process {
        if ($Path) {
            try {
                if ($NoClobber -and (Test-Path $Path)) {
                    throw [System.IO.IOException]::new("File exists")
                }
                Convert-Element -Object $Object | Out-File -FilePath $Path -ErrorAction Stop
            }
            catch {
                Write-Error $_.Exception.Message
            }
        }
        else {
            Convert-Element -Object $Object | Write-Output
        }
    }
}
