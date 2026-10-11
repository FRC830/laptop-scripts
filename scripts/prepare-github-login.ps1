param(
    [string]$UserName = "Ratpack Student",
    [string]$UserEmail = "ratpack.student@gmail.com",
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host 'GitHub CLI (gh) is not installed.'
    Write-Host 'Install it with:'
    Write-Host 'winget install --id GitHub.cli --source winget -e'
    exit 1
}

# Set a team default so the shared profile remains usable before the student signs in.
git config --global user.name $UserName
git config --global user.email $UserEmail

if (-not $Force) {
    & gh auth status 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host 'GitHub auth already exists for this shared profile.'
        gh auth setup-git
        exit 0
    }
}

Write-Host 'Launching GitHub authentication for this student session...'
Write-Host 'The browser will open so the student can sign in to GitHub.'

gh auth login --hostname github.com --git-protocol https --web
if ($LASTEXITCODE -ne 0) {
    throw 'GitHub login failed. The student was not authenticated.'
}

gh auth setup-git

Write-Host 'GitHub auth is ready for commit and push operations.'
