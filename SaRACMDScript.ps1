# Initialize variables
$title = 'SaRA EULA'
$choices = '&Yes', '&No'
$ProgressPreference = 'SilentlyContinue'
$Destination = Join-Path $env:TEMP "SaRACMD\LatestSaRACMD.zip"
$Folder = Join-Path $env:TEMP "SaRACMD"
$Temp = $env:TEMP
$locerr = "A folder named SaRACMD already exists in $Temp, please delete it first!"
$question = "Do you accept the SaRA application EULA? Found in $Folder"

# Function to clean up downloaded files and directories
function CleanUp-DownloadedFiles {
    Remove-Item -Path $Destination -ErrorAction SilentlyContinue
    Remove-Item -Path $Folder -Recurse -ErrorAction SilentlyContinue
}

# Check if the SaRACMD directory already exists
if (Test-Path -Path $Folder) {
    Write-Host $locerr
    explorer $Folder
    Read-Host "Press Enter to exit script..."
    exit
}

try {
    # Create SaRACMD directory
    New-Item -Path $Folder -ItemType Directory -ErrorAction Stop | Out-Null

    # Start SaRA Download
    Write-Host 'Starting SaRA Download'
    Invoke-WebRequest -Uri 'https://aka.ms/SaRA_CommandLineVersionFiles' -OutFile $Destination -ErrorAction Stop

    # Extract the ZIP file
    Expand-Archive -Path $Destination -DestinationPath $Folder -ErrorAction Stop

    # Open EULA in notepad
    notepad.exe "$Folder\SaraEULA.txt"

    # Prompt user for EULA acceptance
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    if ($decision -eq 0) {
        # EULA accepted, execute SaRACmd.exe
        & "$Folder\SaRACmd.exe" -s ExpertExperienceAdminTask -AcceptEULA

        # Open explorer with logs
        explorer "$env:localappdata\saralogs\UploadLogs"
    } else {
        Write-Host 'EULA was not accepted'
        # Optional: Clean up if EULA is not accepted
        # CleanUp-DownloadedFiles
    }
} catch {
    Write-Host "An error occurred: $_"
    # Consider cleanup on error if appropriate
    # CleanUp-DownloadedFiles
} finally {
    Read-Host "Press Enter to close script..."
}

# Remove downloaded files and created directories if needed
# CleanUp-DownloadedFiles
