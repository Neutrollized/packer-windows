$ErrorActionPreference = "Stop"

echo "-> Removing all Windows features that are not enabled..."
Get-WindowsFeature |
? { $_.InstallState -eq 'Available' } |
Uninstall-WindowsFeature -Remove

echo "-> Clean the WinSxS folder of rollback files for all installed updates..."
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

echo "-> Defrag C drive..."
Optimize-Volume -DriveLetter C
