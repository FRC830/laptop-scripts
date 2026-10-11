# laptop-scripts
FRC laptop installation and configuration scripts for a high school robotics team.

This repository contains Windows setup utilities for student programmers and mentors. It installs the common FRC software stack, configures Git for team use, and includes a few cleanup and troubleshooting helpers that are useful when preparing laptops for a build season.

## What this repo installs
- Git
- Phoenix Tuner X
- PathPlanner
- Raspberry Pi Imager
- REV Hardware Client
- FRC Game Tools
- WPILib

## Quick start
1. Open the relevant script in the scripts folder for your season.
2. Review the team-specific values in the Git configuration block and replace the placeholder identity with your team or school defaults.
3. Run the DSC configuration on a Windows machine with administrator rights.
4. Reboot if the FRC Game Tools or WPILib installer prompts for it.

## Team customization
Before using the setup script in a new environment, update the student/mentor Git identity in the script so it reflects your team or organization instead of a single student account.

## Documentation
- docs/git.md – Git setup guidance
- docs/windows-applications.md – application install notes
- docs/cleanup.md – Windows cleanup commands
