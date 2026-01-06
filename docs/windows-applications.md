# FRC Team 830 Windows Applications

This guide provides instructions to install specialty FRC tools for **Windows** computers.  Most of these tools are *only available for the Windows operating system*.

Each command must be run in a PowerShell terminal.  You may need to click *Accept* or *Okay* on a security pop-up.

## FRC Game Tools 2025
This includes the **FRC Driver Station** and other tools necessary for interacting with the *RoboRIO*.

[WPI Lib Documentation](https://docs.wpilib.org/en/stable/docs/zero-to-robot/step-2/frc-game-tools.html)

[National Instruments Documentation](https://www.ni.com/en/support/downloads/drivers/download.frc-game-tools.html)

### Online Install
```powershell
# Download the Online Installer to the "Downloads" folder
Invoke-WebRequest https://download.ni.com/support/nipkg/products/ni-f/ni-frc-2025-game-tools/25.0/online/ni-frc-2025-game-tools_25.0_online.exe -OutFile ${env:userprofile}\Downloads\frc-game-tools.exe

# Install FRC Game Tools Silently
& ${env:userprofile}\Downloads\frc-game-tools.exe --passive --prevent-reboot --accept-eulas --hide-splashscreen
```

## REV Hardware Client
[Documentation](https://docs.revrobotics.com/rev-hardware-client)

```powershell
winget install --exact --id REVRobotics.REVHardwareClient --silent --accept-package-agreements --accept-source-agreements
```

*Installs the REV Hardware Client.*

---

## Install Phoenix Tuner X
[Documentation](https://v6.docs.ctr-electronics.com/en/stable/docs/tuner/index.html)
```powershell
# Installs Phoenix Tuner X from the Microsoft Store
winget install --exact --id 9NVV4PWDW27Z --name "Phoenix Tuner X" --source msstore --silent --accept-package-agreements --accept-source-agreements
```

## Install FRC PathPlanner
```powershell
# Installs FRC PathPlanner from the Microsoft Store
winget install -eh --name "FRC PathPlanner" -s msstore --scope user --accept-package-agreements --accept-source-agreements
```