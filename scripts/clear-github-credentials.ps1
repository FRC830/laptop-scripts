# Clears Git and GitHub credentials at logoff or shutdown on a shared lab laptop.
# This is intended for a single-profile Windows 11 Home machine used by multiple students.

$ErrorActionPreference = 'Stop'

function Remove-GitConfigValue {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Key
    )

    & git config --global --unset-all $Key 2>$null | Out-Null
}

# Remove Git identity config
Remove-GitConfigValue -Key 'user.name'
Remove-GitConfigValue -Key 'user.email'

# Remove credential helper config values
foreach ($key in @(
    'credential.helper',
    'credential.https://github.com.helper',
    'credential.https://github.com.username',
    'credential.https://github.com.password',
    'core.sshCommand'
)) {
    Remove-GitConfigValue -Key $key
}

# Remove credential files if they were created for this session
foreach ($path in @(
    "$HOME\.git-credentials",
    "$HOME\.config\git\credentials",
    "$env:USERPROFILE\.git-credentials",
    "$env:USERPROFILE\.config\git\credentials"
)) {
    if (Test-Path -LiteralPath $path) {
        Remove-Item -LiteralPath $path -Force -ErrorAction SilentlyContinue
    }
}

# Remove GitHub entries from Windows Credential Manager if they were cached
if (Get-Command cmdkey -ErrorAction SilentlyContinue) {
    $targets = cmdkey /list 2>$null | Select-String -Pattern 'Target:' | ForEach-Object {
        $_.Line -replace '^Target:\s*', ''
    }

    foreach ($target in $targets) {
        if ($target -match 'github|git:https://github.com') {
            cmdkey /delete:$target 2>$null | Out-Null
        }
    }
}

# If GitHub CLI is installed, sign out of GitHub.com
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh auth logout --hostname github.com 2>$null | Out-Null
}

Write-Host 'Temporary GitHub session credentials cleared.'
