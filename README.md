# windows-hardening-toolkit
# Windows Hardening ToolKit

**By:** Jeremias Quintero (mjeq)

---

# Overview
The following repository holds a set of **PowerShell Automation Scripts** which are intended to automate **System Hardening** and **Endpoint Optimization** for **Windows 10/11**. The purpose of this collection is to reduce the **attack surface** of your Windows Systems by turning off **Telemetry**, and by **managing** **non-essential Services**.


# Components

## privacy_hardener.ps1

* **Safety First**: Creates a **System Restore Point** before it will make any **changes** to your Windows System.
* **Privacy**: Sets **Windows Telemetry** to the **'Security'** Level (**0**) and restricts its functionality.
* **Optimization**: Stops **known Tracking Services** (`DiagTrack`, `dmwappushservice`) from running.


# Usage

> **WARNING ⚠️ :** Please run these scripts **in a test environment** prior to using them in production.


1. Launch **PowerShell as Administrator**.
2. Run the script:
```powershell
.\privacy_hardener.ps1


# Undo
# If there's an issue with the **script**, or if you would like to **undo** all the **changes**, then follow the steps below:

# How to restore your system:
Press Win + R on your keyboard.
Type rstrui.exe and press Enter.
Select "Choose a different restore point".
Look for the snapshot named: **Pre-Hardening-mjeq**.
Follow the **prompts** to restore your Windows to the **exact same state** that it was in before the **script ran**.
