# Git Installation and Configuration Guide

## Install Git
### Windows
```powershell
winget install --exact --id Git.Git --silent --accept-package-agreements --accept-source-agreements
```

### Mac & Linux
[Download Git](https://git-scm.com/downloads)

## Configure Git
Git configuration should be performed using the Git Bash application that is installed with Git.

### Default team identity
Use the repository defaults for a shared lab machine:
```bash
git config --global user.name "Ratpack Student"
git config --global user.email "ratpack.student@gmail.com"
```

### Use environment variables on a shared laptop
The setup script can honor temporary overrides without editing the repo. Set these before running the installer or before a student session:
```powershell
$env:GIT_USER_NAME = "Student Name"
$env:GIT_USER_EMAIL = "student@example.org"
$env:GITHUB_USER_NAME = "Student Name"
$env:GITHUB_USER_EMAIL = "student@example.org"
```

These values are useful when a machine is shared and you want a known default for students who have not yet configured GitHub, while still letting a student override it for a temporary session.

### Better option for personal GitHub access on shared laptops
Because these are shared Windows 11 Home machines with a single profile and no password, the safest pattern is not to leave a personal GitHub identity or token stored globally.

Prefer one of these:

1. Each student uses a temporary SSH key for that student session and sets `core.sshCommand` for the duration of the session.
2. GitHub credentials are configured only for the current login session and removed at logoff.
3. A shared team account is used only as the default, and students are encouraged to switch to their own account only when needed.

This is much safer than keeping a previous student's GitHub identity in the shared profile.

### Automatic cleanup on logout
A machine-level logout script should clear the temporary Git identity and cached credentials after each student session. The repository includes a cleanup script for this pattern:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\clear-github-credentials.ps1
```

This should be registered as a Windows logoff task so it runs when a student logs out or the machine is shut down.

### Trigger GitHub login when a student is ready to push
When a student is prepared to authenticate with their own GitHub account, run the helper script:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\scripts\prepare-github-login.ps1
```

This will:
- verify GitHub CLI is installed
- set a default team identity if needed
- open the GitHub sign-in flow for the current session
- run `gh auth setup-git` so GitHub authentication is ready for commit and push operations

After the student finishes, the cleanup task should clear the session credentials automatically during logout.

### Enable Pushing Commits
Use the GitHub credentials or SSH keys configured for your team before pushing changes from a student laptop.
