#Get all active directory computers and sort by name
get-adcomputer -filter * | sort-object name | % { $_.name } 

#Show all Active Directory COMPUTERS in alphabetical order
get-adcomputer -filter * | sort-object name | % { $_.name } 

#Show last COMPUTER objects which has been created in last week
$endDate = [datetime]::Now; $startDate = $endDate.AddDays(-7); Get-ADComputer -Filter 'whenCreated -ge $startDate -and whenCreated -lt $endDate' -Properties whenCreated | Select-Object -Property SamAccountName,whenCreated

#Show all COMPUTER objects in creation order
Get-ADComputer -Filter * -Properties whenCreated,name | sort whenCreated | ft whenCreated,name -AutoSize

#Show the last computer objects which has MININT in the name
Get-ADComputer -Filter 'name -Like "MININT*"' -Properties name,whenCreated,IPv4Address | sort whenCreated | ft name,whenCreated,IPv4Address
