# download and install updates from wsus server
$ErrorActionPreference = "Stop"

Get-WUInstall -Verbose -IgnoreReboot -AcceptAll
