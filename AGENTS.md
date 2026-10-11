# AGENTS.md

## Project overview
This repository contains Windows setup utilities for a high school robotics team. It installs and configures the common software stack used for FRC programming and build-season laptop preparation.

## Repository purpose
- Install and configure Windows tooling for robotics team laptops
- Keep shared-laptop Git defaults safe and reusable
- Provide helper scripts for cleanup and temporary GitHub authentication
- Maintain setup scripts for season-specific software installs

## Operating environment
- Target platform: Windows 11
- Shared-laptop model: single shared Windows profile, no password
- Scripts are primarily PowerShell-based
- Use git and GitHub CLI (`gh`) where appropriate

## Coding conventions
- Prefer clear, readable PowerShell over clever one-liners
- Use `$ErrorActionPreference = 'Stop'` in scripts that should fail fast
- Use native command exit codes for external tools (`gh`, `git`, `winget`), not output truthiness
- Keep fallback defaults explicit and team-safe
- For shared laptops, avoid leaving personal GitHub credentials in global config after logout

## Default Git identity policy
The repo historically uses the team-safe default identity unless a student explicitly overrides it for a temporary session.

Required default values for repo examples:
- Name: `Ratpack Student`
- Email: `ratpack.student@gmail.com`

For temporary per-student use on shared laptops, support environment variables before the script runs:
- `$env:GIT_USER_NAME`
- `$env:GIT_USER_EMAIL`
- `$env:GITHUB_USER_NAME`
- `$env:GITHUB_USER_EMAIL`

If those are unset, scripts should fall back to the team default values.

## Script guidance
- Keep scripts idempotent when possible
- Validate required command availability before continuing
- Print clear user-facing instructions when installation or auth prerequisites are missing
- For logout cleanup, remove GitHub auth and cached credentials automatically when a session ends

## Validation
Before finishing work, validate with:
```powershell
git diff --check
```

This repository is small and focused; prefer minimal, targeted edits over broad refactors.

## Preferred workflow
1. Keep changes scoped to the relevant script or doc
2. Preserve the repo’s shared-laptop safety model
3. Use fallback defaults for unconfigured students
4. Keep temporary GitHub auth limited to the current session
5. Clean up credentials on logout or shutdown
