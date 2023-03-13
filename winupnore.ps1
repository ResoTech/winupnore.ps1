# Set execution policy to unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

#false confirm TESTING!!!!
# Install-PackageProvider -Name NuGet -Confirm:$false
#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Install the PSWindowsUpdate module
Install-Module -Name PSWindowsUpdate -force

# Import the module
Import-Module -Name PSWindowsUpdate

# Check for updates
$Updates = Get-WUInstall

# Install updates
if ($Updates) {
    Write-Output "Installing updates..."
    #Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot
    #changed time to 14:00 from 23:45
    Install-WindowsUpdate -AcceptAll -IgnoreReboot -ScheduleReboot $(Get-Date "14:00")
}
else {
    Write-Output "No updates available."
}


#ScheduleReboot 01.31.2023 00:00:00  - Exception Error
