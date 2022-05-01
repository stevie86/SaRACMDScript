# SaRACMDScript
This small script allows the process for the usage of the SaRA support tool command-line version to be as automated as possible.


Original SaRA comman-line version tool can be found here:
https://docs.microsoft.com/en-us/office365/troubleshoot/administration/sara-command-line-version


The script can be easily accessed / run by running the following powershell cmdlets:

$SaRACMDScript = Invoke-WebRequest https://raw.githubusercontent.com/ricardoMpacheco/SaRACMDScript/main/SaRACMDScript.ps1
Invoke-Expression ($SaRACMDScript.Content)
