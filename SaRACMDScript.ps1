$ProgressPreference = 'SilentlyContinue'
$Destination = $env:TEMP +"\SaRACMD\LatestSaRACMD.zip"
$Folder =  $env:TEMP +"\SaRACMD\"
$Temp = $env:TEMP
$locerr = 'A folder named SaRACMD already exists in ' + $Temp + ', please delete it first!'


if (Test-Path -Path $Destination) {
    $locerr
    Read-Host "Press any key to close script..."
} else {
New-Item -Path $Temp -Name "SaRACMD" -ItemType "directory" | Out-Null
Invoke-WebRequest -uri https://aka.ms/SaRA_CommandLineVersionFiles -OutFile $Destination

Expand-Archive $Destination -DestinationPath $Folder

sleep 5
cd $Folder

.\SaRACmd.exe -s ExpertExperienceAdminTask -AcceptEULA

explorer $env:localappdata\saralogs\UploadLogs

 Read-Host "Press any key to close script..."

}
