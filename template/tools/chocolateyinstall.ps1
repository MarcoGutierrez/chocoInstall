# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f
#Don't Change
$ErrorActionPreference = 'Stop'; # stop on all errors

#Change
$packageName= 'Program' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#Change
$fileLocation = Join-Path $toolsDir 'nameOfProgram.exe'

$packageArgs = @{
  packageName   = $packageName
  #Change to correct extension
  fileType      = 'exe' #only one of these: exe, msi, msu
  file         = $fileLocation
#Change
  softwareName  = 'office16' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  #MSI
  silentArgs    = "/S" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0)

}

Install-ChocolateyInstallPackage @packageArgs
#This makes it so you are installing locally and not online
