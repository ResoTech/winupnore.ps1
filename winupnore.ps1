# Set execution policy to unrestricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

#false confirm TESTING!!!!
Install-PackageProvider -Name NuGet -Confirm:$false

# Install the PSWindowsUpdate module
Install-Module -Name PSWindowsUpdate -force

# Import the module
Import-Module -Name PSWindowsUpdate

# Check for updates
$Updates = Get-WUInstall

# Install updates
if ($Updates) {
    Write-Output "Installing updates..."
    Install-WindowsUpdate -Install -AcceptAll
}
else {
    Write-Output "No updates available."
}
