# download and install updates from wsus server
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

Get-WUInstall -Verbose -IgnoreReboot -IgnoreUserInput -Category "UpdateRollups" -AcceptAll
