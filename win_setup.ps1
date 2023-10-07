param(
    [Parameter()]
    [switch]$JS,

    [Parameter()]
    [switch]$Java,

    [Parameter()]
    [switch]$Python,

    [Parameter()]
    [switch]$Devops,

    [Parameter()]
    [switch]$Rust,

    [Parameter()]
    [switch]$Cpp,

    [Parameter()]
    [switch]$All
)

function RefreshEnvPath {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

Write-Output "Windows automatic environment setup is running..."
Write-Output "Requirements: Scoop needs to be installed on another shell"
try {
    if (Get-Command "scoop" -ErrorAction Stop) { Write-Output "Scoop already installed!" }
} 
catch {
    Write-Output "Scoop is not installed! Open another shell and install it first!"
    exit -1
}

scoop import .\scoop_config.json
scoop update --all
RefreshEnvPath

if ($JS -or $All) {
    scoop install nvm
}

if ($Java -or $All) {
    scoop install jabba
    scoop install maven
}

if ($Python -or $All) {
    scoop install python
    scoop install poetry
}

if ($Cpp -or $All) {
    scoop install cmake
    scoop install make
    scoop install mingw
}

if ($Rust -or $All) {
    scoop install rustup
}

if ($Devops -or $All) {
    $devtools = "kubectl", "aws", "k9s", "lazydocker"
    foreach ($tool in $devtools) {
        scoop install $tool
    }
}

exit 0