#Get all local firewall rules:
Get-NetFirewallRule -Enabled True | ft Profile,name
