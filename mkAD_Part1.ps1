# # # # # # # Part1
$Secure_String_Pwd = ConvertTo-SecureString "Password1" -AsPlainText -Force
$PScredential = New-Object System.Management.Automation.PSCredential ('Administrator', $Secure_String_Pwd)
$NewDomainName = "JB2.local"
$ParentDomainName = "JB2.local"
$DomainNetbiosName = "JB2"

echo 1
import-module servermanager
echo 2
Get-WindowsFeature AD-Domain-Services
echo 3
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
echo 4
Import-Module ADDSDeployment

echo 5 
Test-ADDSForestInstallation `
  -DomainName  $NewDomainName `
  -SafeModeAdministratorPassword $Secure_String_Pwd `
  -NoDnsOnNetwork

echo "6 - step will do reboot "
  Install-ADDSForest `
    -CreateDnsDelegation:$false `
	-DomainName $NewDomainName `
	-DomainNetbiosName $NetBiosName `
	-SafeModeAdministratorPassword $Secure_String_Pwd `
    -InstallDNS:$true `
	-Force:$true

echo 7
Install-ADDSDomainController `
  -DomainName $NewDomainName `
  -Credential $PScredential `
  -SafeModeAdministratorPassword $Secure_String_Pwd
  	
echo end of part 1
	
  