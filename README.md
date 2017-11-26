# Packer Images

* currrently only for Windows2012R2, but can easily be extended to other versions with some minor modifications to the packer.json file

## Requirements

* [Packer](https://www.packer.io/)

* upload your Windows2012R2 ISO to the iso directory
* enter in the ISO name, checksum and checksum type in the packer.json variables block at the top for the appropriate variables

### About Building Windows Hosts

Unlike Linux, Windows uses WinRM over SSL as the remoting tool, but is not a enabled/configured by default and hence it's configured via PS1 script (ConfigureRemotingForAnsible.ps1) and run during setup initial OS install (as a step outlined in Autounattend.xml)

WinRM over SSL is setup via [ConfigureRemotingForAnsible.ps1](https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1) which can be found on Ansible GitHub repo and is required if you want Windows Support for Ansible (along with pywinrm on your Linux controller [you can find out more here](http://docs.ansible.com/ansible/latest/intro_windows.html))

Updates are done in stages with system restarts in between each: Service Packs, Critical, Update Rollups, Security, Update All (the catchall at the end).

### Optional (Provisioning) Scripts

* setup-wsusclient.ps1 - If you have your own internal WSUS to control which updates are allowed, you can enter that info in the script and have it run at the beginning of provisioning before the updates begin.

* install-wmf5.ps1 - Windows Management Framework (WMF) 5.1 is also installed as PowerShell ver. 5 is a requirement for the Ansible Windows DSC module.  If you don't require the use of Ansible and/or the DSC module, you can opt to leave this out.  In Windows 2016, the standard PS version already meets the requirements and you wouldn't need this.
