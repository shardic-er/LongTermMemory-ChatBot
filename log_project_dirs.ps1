# Store the root directory depth for later use
$rootDepth = (Get-Location).Path -split '\\' | Measure-Object | Select-Object -ExpandProperty Count

# Get ignore patterns from the external file
$ignorePatterns = Get-Content -Path .\ignore_patterns.txt -Raw | Out-String
$ignoreRegex = ($ignorePatterns -split "`r`n" | Where-Object { $_.Trim() -ne "" }) -join "|"

Write-Host "Logging project structure to: project_structure.txt"

Get-ChildItem -Recurse | Where-Object { $_.FullName -notmatch $ignoreRegex } | ForEach-Object {
    $depth = ($_.FullName -split '\\').Count - $rootDepth - 1;
    ("    " * $depth) + $_.Name
} > project_structure.txt