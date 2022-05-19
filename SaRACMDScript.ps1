
$title    = 'SaRA EULA'
$choices  = '&Yes', '&No'
$ProgressPreference = 'SilentlyContinue'
$Destination = $env:TEMP +"\SaRACMD\LatestSaRACMD.zip"
$Folder =  $env:TEMP +"\SaRACMD\"
$Temp = $env:TEMP
$locerr = 'A folder named SaRACMD already exists in ' + $Temp + ', please delete it first!'
$question = 'Do you accept the SaRA application EULA? Found in ' + $Folder


if (Test-Path -Path $Destination) {
    $locerr
   explorer $env:TEMP
   Read-Host "Press any key to close script..."
} else {

New-Item -Path $Temp -Name "SaRACMD" -ItemType "directory" | Out-Null
sleep 2

cd $Folder
Write-Host 'Starting SaRA Download'
Invoke-WebRequest -uri https://aka.ms/SaRA_CommandLineVersionFiles -OutFile $Destination
Expand-Archive $Destination -DestinationPath $Folder
sleep 5
notepad.exe $Folder\SaraEULA.txt

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {

.\SaRACmd.exe -s ExpertExperienceAdminTask -AcceptEULA

explorer $env:localappdata\saralogs\UploadLogs

 Read-Host "Press any key to close script..."
} else {
    Write-Host 'EULA was not accepted'
}


}
