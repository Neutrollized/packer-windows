# mounting ISO
Mount-DiskImage -ImagePath "C:\Users\packer\VBoxGuestAdditions.iso"

# adding certs to trusted provider
#5.0
E:\cert\VboxCertUtil.exe add-trusted-publisher E:\cert\oracle-vbox.cer
#5.1
E:\cert\VboxCertUtil.exe add-trusted-publisher E:\cert\vbox-sha1.cer
E:\cert\VboxCertUtil.exe add-trusted-publisher E:\cert\vbox-sha256.cer
E:\cert\VboxCertUtil.exe add-trusted-publisher E:\cert\vbox-sha256-r3.cer

# silent install
E:\VBoxWindowsAdditions.exe /S
