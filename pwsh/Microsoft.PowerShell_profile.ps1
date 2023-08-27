& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "~\.config\ohmyposh\theme.omp.json" --print) -join "`n"))
Import-Module -Name Terminal-Icons

# Alias
Set-Alias -Name vim -Value nvim

# Utilities

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
function Reload () {
	@(
		$profile.AllUsersAllHosts,
		$profile.AllUsersCurrentHost,
		$profile.CurrentUserAllHosts,
		$profile.CurrentUserCurrentHost
	) | % {
		if(Test-Path $_){
			Write-Verbose "Running $_"
			. $_
			}
	}
}

# Open Url
function open ($command) {
	start chrome $command
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
