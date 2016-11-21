#Show all Locked accounts in Active Direcotry
Search-ADAccount -LockedOut | select Name, SamAccountName

#Unlock user accounts one by one with confirmation
Search-ADAccount -LockedOut | Unlock-AdAccount –confirm

#Show all AD users in alphabetical ordet
Get-ADUser -filter * -Properties name | sort name | % { $_.name } 

#Show the newest users in AD
Get-ADUser -filter * -Properties whenCreated,name | sort whenCreated | ft whenCreated,name -AutoSize

#Show the oldest users
Get-ADUser -filter * -Properties whenCreated,name | sort whenCreated -Descending | ft whenCreated,name -AutoSize

#Show hard working people
Get-ADUser -filter * -Properties PasswordNeverExpires,name | ? { $_.PasswordNeverExpires -eq $false } | sort name | % { $_.name }

#Show lazy bastards
Get-ADUser -filter * -Properties PasswordNeverExpires,name | ? { $_.PasswordNeverExpires -eq $True } | sort name | % { $_.name }

#List all email addresses for user orinoko
Get-ADUser orinoko -Properties msExchShadowProxyAddresses | % { $_.msExchShadowProxyAddresses }

#Which user has email address orinoko@gmail.com assigned
Get-ADUser -filter * -Properties msExchShadowProxyAddresses,name | ? { $_.msExchShadowProxyAddresses -like "*orinoko@gmail.com*" } | % { $_.name }

#Show users with expired password
Get-ADUser -Filter * -Properties name,PasswordExpired | ? { $_.PasswordExpired -eq $true } | sort name | ft name -AutoSize

#Show active users with expired password
Get-ADUser -Filter * -Properties name,Enabled,PasswordExpired | Where-Object { $_.Enabled -eq $true -and $_.PasswordExpired -eq $true } | sort name | ft name -AutoSize

#Show Disable AD users
Get-ADUser -Filter * -Properties name,Enabled | Where-Object { $_.Enabled -eq $false } | sort name | ft name -AutoSize

#Show Disabled users with expired password
Get-ADUser -Filter * -Properties name,Enabled,PasswordExpired | Where-Object { $_.Enabled -eq $false -and $_.PasswordExpired -eq $true } | sort name | ft name -AutoSize

#Show users which are supposed to used the system but has never used it
Get-ADUser -Filter * -Properties LastLogonDate,name,Enabled | Where-Object { $_.Enabled -eq $true -and $_.LastLogonDate -eq $null } | sort name | ft name -AutoSize

#Show newly created users which are superposed to change password at first logon
Get-ADUser -Filter * -Properties LastLogonDate,name,Enabled | Where-Object { $_.Enabled -eq $true -and $_.LastLogonDate -eq $null -and $_.PasswordExpired -eq $true } | sort name | ft name -AutoSize

#Possible hacker attempts
Get-ADUser -Filter * -Properties name,badPwdCount,Enabled,LockedOut,LastLogonDate,accountExpires | ? { $_.badPwdCount -gt 0 } | ft name,badPwdCount,Enabled,LockedOut,LastLogonDate,accountExpires -AutoSize

#Which user can not enter correct password
Get-ADUser -Filter * -Properties name,LastLogonDate,badPwdCount | ? { $_.badPwdCount -gt 0 } | sort LastLogonDate | ft name,LastLogonDate

#Add AD group to all users located in specific OU
Get-ADUser -Filter * -SearchBase "OU=Service Users, DC=contoso,DC=com" -Properties Name, EmailAddress | % { Add-ADGroupMember -identity "Contoso Service Users" -Member $_.DistinguishedName }

#Search all active users without users in groups Service Users, Domain Admins, Brokers
Get-ADUser -filter {(Enabled -eq $True)} -Properties LastLogonDate | ? { ($_.memberof | Out-String) -notmatch "Service Users|Domain Admins|Brokers"}| sort LastLogonDate | ft Name,SamAccountName,LastLogonDate -AutoSize
