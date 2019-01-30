# # # # # # # Part2
$Secure_String_Pwd = ConvertTo-SecureString "Password1" -AsPlainText -Force
$PScredential = New-Object System.Management.Automation.PSCredential ('Administrator', $Secure_String_Pwd)
$NewDomainName = "JB2.local"
$ParentDomainName = "JB2.local"
$DomainNetbiosName = "JB2"

echo 8 
Test-ADDSDomainInstallation `
  -NewDomainName $NewDomainName `
  -ParentDomainName $ParentDomainName `
  -ADPrepCredential $PScredential `
  -Credential $PScredential `
  -SafeModeAdministratorPassword $Secure_String_Pwd
  
echo 9 
Test-ADDSDomainControllerInstallation `
  -DomainName $NewDomainName `
  -Credential $PScredential `
  -SafeModeAdministratorPassword $Secure_String_Pwd
  
echo "*** DONE *******"
 
