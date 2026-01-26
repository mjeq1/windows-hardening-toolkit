# windows-hardening-toolkit
# Windows Hardening Toolkit

**Created By:** mjeq (Jeremias Quintero)
---

# Description 
This repository contains **PowerShell automation scripts** that can be used to **automate hardening** and **endpoint optimization** of **Windows 10/11 systems**. The main goal of this collection of scripts is to **reduce the attack surface** of your **Windows systems** by disabling **telemetry**, and also **managing non-essential services**.

# Tools
## Privacy Hardener

* **First Safety**: Creates a **System Restore Point** before the changes are made to your Windows System.
* **Private**: Sets **Windows Telemetry** to the **security level (0)** and disables telemetry functionality.
* **Optimize**: Stops known tracking services (`DiagTrack` , `dmwappushservice`) from running.

# How to Use

> **WARNING ⚠️ :** Always test these scripts **in a test environment** prior to testing them in a **production environment**.

1. Start **PowerShell as an administrator**.
2. Run the script:
```powershell
.\privacy_hardener.ps1

# Revert
# If there is a problem with the **script**, or you want to **reverse** all the **changes**, then follow the steps below:

# To restore your system:
Press Win + R on your keyboard.
Type rstrui.exe and click enter.
Select "Choose a different restore point".
Find the name of the **snapshot** : **Pre-Hardening-mjeq**.
Follow the prompts to restore your Windows to the exact same **state** that it was in when the **script ran**.
