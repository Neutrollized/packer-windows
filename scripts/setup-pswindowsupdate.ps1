$ErrorActionPreference = "Stop"

$env:tmp_dir = "tmp"
$env:repo_url = "https://gallery.technet.microsoft.com"
$env:repo_directory = "scriptcenter/2d191bcd-3308-4edd-9de2-88dff796b0bc/file/41459/47"
$env:script_name = "PSWindowsUpdate.zip"

if (!(Test-Path C:\${env:tmp_dir} -PathType Container)) {
    New-Item -ItemType Directory -Force -Path C:\${env:tmp_dir}
}

# this is to ignore ssl cert errors; basically "--insecure"
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

Invoke-WebRequest -Uri "${env:repo_url}/${env:repo_directory}/${env:script_name}" -OutFile "C:\${env:tmp_dir}\${env:script_name}"

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "C:\${env:tmp_dir}\${env:script_name}" "C:\Windows\System32\WindowsPowerShell\v1.0\Modules"

#Set-ExecutionPolicy RemoteSigned -force

Import-Module PSWindowsUpdate


#verification of setup
Get-WUServiceManager
