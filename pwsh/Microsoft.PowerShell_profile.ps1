$ENV:STARSHIP_CONFIG = "C:\Users\johannes.kirchner\starship.toml"
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

# Alias
Set-Alias -Name vim -Value nvim

# Utilities

function :q () {
  exit
}

function .. () {
  cd ..
}

function ... () {
  cd ../..
}

function .... () {
  cd ../../..
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Edit-Profile () {
	vim $profile
}

function Open ($param) {
  if ($param){
    Invoke-Item $param
  }else{
    Invoke-Item .
  }
}

function ShowMarkdown ($param) {
  if ($param){
    grip $param
  }else{
    return
  }
}

function MakePDF ($param) {
  if ($param) {
    $mdFile = Get-ChildItem $param
    $nameArr = $mdFile.Name.Split(".")
    $pdf = ""
    if ($nameArr.Length -gt 2){
      $i = 0
      $end = $nameArr.Length
      $end -= 1
      while ($i -lt $end){
        $pdf += $nameArr[$i]
        $pdf += "_"
        $i++
      }
    }
    else{
      $pdf = $nameArr[0]
    }
    $pdf += ".pdf"
    "Processing " + $mdFile.Name + " to " + $pdf
    pandoc $mdFile.Name -s -f markdown -t pdf -o $pdf
  }else{
    return
  }
}

function ll () {
	ls -Force
}

function c () {
  cls
  ls
  pwd
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
