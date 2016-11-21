#Get version
$psversiontable.psversion

#Show module path
$env:psmodulepath

#Install WinRM service on system. This will allow execute PowerShell commands on this system from another station:
winrm qc -force

#Search for commands that starts with
get-command -verb resolve

#Search for commands that ends with
get-command -noun service
get-command -noun computer

#Show all string properties and methods
"1"|gm

#Show all number properties and methods
1|gm

#Show all wmi and cim related commands:
get-command *wmi*
get-command *cim*

#Create array, add item, count size
$array=@{"first"="value1";"second"="value2"}
$array.add("third","value3")
"Now " +($array.Count) +" elements in array"

#Start a loop
$choice=""
do {
$choice=read-host "enter q to quit"
} while ($choice -ne 'q')

#Look for all classes which includes "Disk" in name:
get-cimclass -ClassName "*disk*"

#Show few classes which i can work with:
get-wmiObject -namespace "root/cimv2" -list

#Search all classes which include system in the name:
get-wmiObject -namespace "root/cimv2" -list | ? name -Like "*system*"