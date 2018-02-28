$ErrorActionPreference = "Stop"

# replace [WSUS-SERVER-FQDN] with your WSUS server's info (i.e. mywsusserver.example.com)
Stop-Service wuauserv


$registryPath1 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$registryPath2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
$name1 = "WUServer"
$name2 = "WUStatusServer"
$name3 = "UseWUServer"
$wsus = "http://[WSUS-SERVER-FQDN]:8530"
$value = "1"

IF(!(Test-Path $registryPath1)) {
  New-Item -Path $registryPath1 -Force | Out-Null
  New-ItemProperty -Path $registryPath1 -Name $name1 -Value $wsus
  New-ItemProperty -Path $registryPath1 -Name $name2 -Value $wsus
} ELSE {
  New-ItemProperty -Path $registryPath1 -Name $name1 -Value $wsus
  New-ItemProperty -Path $registryPath1 -Name $name2 -Value $wsus
} 

IF(!(Test-Path $registryPath2)) {
  New-Item -Path $registryPath2 -Force | Out-Null
  New-ItemProperty -Path $registryPath2 -Name $name3 -Value $value -PropertyType DWORD -Force | Out-Null
} ELSE {
  New-ItemProperty -Path $registryPath2 -Name $name3 -Value $value -PropertyType DWORD -Force | Out-Null
} 
