Get-WUInstall -Verbose -IgnoreReboot -KBArticleID "KB3191564" -AcceptAll
Get-WUInstall -Verbose -IgnoreReboot -KBArticleID "KB3191565" -AcceptAll

# installs latest powershell 5+
#choco install -y powershell

# forces final exit code to be 0 as powershell install requires a reboot and exit code for that is 3010
exit 0
