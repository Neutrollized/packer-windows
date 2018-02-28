# hat tip goes out to: github.com/luciusbono
$ErrorActionPreference = "Stop"

$isoPath = "C:\Users\packer\VBoxGuestAdditions.iso"


# mounting ISO
Mount-DiskImage -ImagePath $isoPath


# adding certs to trusted provider
$certDir = ((Get-DiskImage -ImagePath $isoPath | Get-Volume).Driveletter + ':\cert\')
$vboxCertUtil = ($certDir + 'VBoxCertUtil.exe')

if (Test-Path ($vboxCertUtil)) {
	Get-ChildItem $certDir *.cer | ForEach-Object { & $vboxCertUtil add-trusted-publisher $_.FullName --root $_.FullName }
} else {
	$certPath = ($certPath + 'oracle-vbox.cer')
	certutil -addstore -f "TrustedPublisher" $certPath
}


# silent install
$exe = ((Get-DiskImage -ImagePath $isoPath | Get-Volume).Driveletter + ':\VBoxWindowsAdditions.exe')
$options = '/S'

Start-Process $exe $options -Wait


# clean up
Dismount-DiskImage -ImagePath $isoPath
Remove-Item $isoPath
