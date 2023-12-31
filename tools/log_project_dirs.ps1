# Get the directory where the script is located
$scriptDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

# Store the parent directory of the script's location
$parentDirectory = (Get-Item $scriptDirectory).Parent.FullName

# Get ignore patterns from the external file in the script's directory
$ignorePatternsPath = Join-Path -Path $scriptDirectory -ChildPath "ignore_patterns.txt"

# Check if ignore patterns file exists
if (-not (Test-Path -Path $ignorePatternsPath)) {
    Write-Host "Ignore patterns file not found: $ignorePatternsPath"
    exit
}

$ignorePatterns = Get-Content -Path $ignorePatternsPath -Raw | Out-String
$ignoreRegex = ($ignorePatterns -split "\r?\n" | Where-Object { $_.Trim() -ne "" }) -join "|"

# Define the path for the output file
$outputFilePath = Join-Path -Path $scriptDirectory -ChildPath "project_structure.txt"

Write-Host "Logging project structure to: $outputFilePath"

# Ensure that the parent directory exists
if (-not (Test-Path -Path $parentDirectory)) {
    Write-Host "Parent directory not found: $parentDirectory"
    exit
}

# Perform the directory listing
try {
    Get-ChildItem -Path $parentDirectory -Recurse |
    Where-Object { -not ($_.FullName -match $ignoreRegex) } |
    Sort-Object FullName |
    ForEach-Object {
        $itemPath = $_.FullName
        $relativePath = $itemPath.Substring($parentDirectory.Length)
        $depth = ($relativePath -split '\\', -1, 'SimpleMatch').Count - 1
        $indent = "    " * $depth
        "$indent$($_.Name)"
    } | Set-Content -Path $outputFilePath
}
catch {
    Write-Host "An error occurred: $_"
    exit
}

Write-Host "Project structure logged successfully."
