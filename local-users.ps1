#Show all users which has logged in:
[Security.Principal.WindowsIdentity]::GetCurrent() | Select-Object -Property Name

#Show logged in users without table column description:
[Security.Principal.WindowsIdentity]::GetCurrent() | % { $_.name }
