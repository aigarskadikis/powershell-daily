#Show all Windows XP Operating Systems
Get-ADComputer -Filter 'OperatingSystem -like "*XP*"' -Properties Name,IPv4Address,OperatingSystem,LastLogonDate,CanonicalName | ft Name,IPv4Address,OperatingSystem,LastLogonDate,CanonicalName -AutoSize

#Show all Windows 10 operating systems
Get-ADComputer -Filter 'OperatingSystem -like "*Windows 10*"' -Properties Name,IPv4Address,OperatingSystem,LastLogonDate,CanonicalName | ft Name,IPv4Address,OperatingSystem,LastLogonDate,CanonicalName -AutoSize

#Show all computers grouped by Operating System
Get-ADComputer -Filter * -Properties Name,IPv4Address,OperatingSystem,LastLogonDate,CanonicalName,description | sort OperatingSystem | ft Name,IPv4Address,OperatingSystem,LastLogonDate,CanonicalName,description -AutoSize
