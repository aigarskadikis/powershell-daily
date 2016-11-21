#Get all running services:
Get-Service | ? Status -eq "Running"

#Get services which is stopped:
Get-Service | ? Status -eq "Stopped"

#Get info about "Windows Update" service:
Get-Service | ? name -eq "wuauserv"

#Get all active processes
Get-Service | ? {$_.Status -ne "stopped"} | ft Name,Status -AutoSize

#Enable Windows Update service
"wuauserv" | Set-Service -StartupType "Automatic"
