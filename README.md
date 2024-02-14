# SaRACMDScript

## Overview
The `SaRACMDScript` is a PowerShell script designed to automate the setup and execution process for the Support and Recovery Assistant (SaRA) command-line tool. The SaRA tool assists in diagnosing and resolving issues with Microsoft Office 365.

For more information about the original SaRA command-line version tool, please visit the official Microsoft documentation:
[Office 365 Support and Recovery Assistant (SaRA) Command-line Version](https://docs.microsoft.com/en-us/office365/troubleshoot/administration/sara-command-line-version)

## Prerequisites
- PowerShell 5.1 or higher
- An internet connection to download the script and SaRA tool
- Appropriate permissions to execute scripts on your system

## Quickstart
To download and run the `SaRACMDScript`, use the following PowerShell commands:

```powershell
# Download the script
$SaRACMDScript = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/stevie86/SaRACMDScript/main/SaRACMDScript.ps1'

# Execute the script content safely after reviewing
# Note: Direct execution of scripts from the internet should be done with caution.
# Always review scripts before execution to confirm safety and suitability for your environment.
$ScriptContent = $SaRACMDScript.Content
# Optional: Review the script content before executing
# Write-Host $ScriptContent

# Execute the script if it is safe to do so
Invoke-Expression $ScriptContent
