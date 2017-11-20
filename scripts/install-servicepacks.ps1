# download and install updates from wsus server
Get-WUInstall -Verbose -IgnoreReboot -IgnoreUserInput -Category "ServicePacks" -AcceptAll
