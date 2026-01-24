# windows-hardening-toolkit
# Windows Hardening Toolkit
By Jeremías Quintero (mjeq)

## Overview
This repository contains a set of automation scripts focused on **System Hardening** and **Endpoint Optimization**. The main goal is to reduce the attack surface of Windows installations by disabling unnecessary services and telemetry.

## Features
- **System Restore Integration:** Automatically creates a restore point before making changes.
- **Privacy Hardening:** Disables Microsoft telemetry and data collection services.
- **Service Management:** Stops and disables non-essential background processes to improve performance.

## Usage
> **Warning:** These scripts modify registry keys and system services. Run as Administrator and at your own risk.

1. Download the `privacy_hardener.ps1` script.
2. Right-click and select "Run with PowerShell" (Admin privileges required).

## Technical Details
- **Language:** PowerShell
- **Target OS:** Windows 10 / 11
- **Focus:** Security, Privacy, and Performance.
