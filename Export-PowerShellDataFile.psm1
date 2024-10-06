$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

foreach ($script in @($Public + $Private)) {
    try {
        . $script.fullname
    }
    catch {
        Write-Error -Message "Failed to import function $($script.fullname): $_"
    }
}

Export-ModuleMember -Function $Public.Basename