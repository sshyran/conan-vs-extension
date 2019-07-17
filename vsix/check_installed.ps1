
$visualStudioInstallation = & "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.VisualStudio.Component.VSSDK -property installationPath
$vcvars64 = Join-Path $visualStudioInstallation 'VC\Auxiliary\Build\vcvars64.bat'
$devenv = Join-Path $visualStudioInstallation 'Common7\IDE\devenv.com'

Write-Host "vcvars64: $vcvars64"
Write-Host "devenv: $devenv"

Set-AppveyorBuildVariable "vcvars64" $vcvars64

$ss1 = . "$vcvars64"
Write-Host "output: $ss1"
$ss2 = . "$devenv" /ConanVisualStudioVersion /?
Write-Host "output: $ss2"
