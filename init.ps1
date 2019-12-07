param($module)

$neoway_host="192.168.65.11:8989"

$module = $module.ToUpper()
Write-Host "module is $module"


function neoway_init_get ($file) {
    Invoke-WebRequest -Method Get -Uri "http://$neoway_host/$module/$file" -OutFile .\$file
}

neoway_init_get("Makefile")
neoway_init_get("make.exe")
neoway_init_get("neowaytools.zip")
neoway_init_get("$module"+"_example.zip")
neoway_init_get("$module"+"_SDK.zip")


function Neoway_Unzip
{
    param([string]$zipfile, [string]$outpath)
    Write-Host $zipfile
    Write-Host "--------------------------------------"
    Write-Host $outpath
    Write-Host "--------------------------------------"

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

neoway_unzip ("$PSScriptRoot\neowaytools.zip") "$PSScriptRoot\neowaytools" 
neoway_unzip ("$PSScriptRoot\"+"$module"+"_example.zip") "$PSScriptRoot\example" 
neoway_unzip ("$PSScriptRoot\"+"$module"+"_SDK.zip") "$PSScriptRoot\neowaytools" 

