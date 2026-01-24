# windows-hardening-toolkit
# Windows Hardening Toolkit

**By:** Jeremías Quintero (mjeq)  

---

### Overview
This repository hosts a collection of PowerShell automation scripts designed for **System Hardening** and **Endpoint Optimization** on **Windows 10/11**. The primary goal is to minimize the attack surface by disabling telemetry and managing non-essential services.

### Components
**`privacy_hardener.ps1`**
- **Safety First:** Automatically creates a **System Restore Point** before making any changes.
- **Privacy:** Restricts Windows Telemetry to the "Security" level (0).
- **Optimization:** Disables known tracking services (`DiagTrack`, `dmwappushservice`).

### Usage
> **⚠️ WARNING:** Always run these scripts in a controlled environment first.

1. Open PowerShell as **Administrator**.
2. Run the script:
   ```powershell
   .\privacy_hardener.ps1

**Undo**
**If something goes wrong or you need to revert the changes.*

**How to restore your system:**
Press Win + R on your keyboard.
Type rstrui.exe and press Enter.
Select "Choose a different restore point".
Look for the snapshot named: Pre-Hardening-mjeq.
Follow the prompts to restore your Windows to the exact state before the script ran.
