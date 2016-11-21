#Show all physical network adapters
get-netadapter -physical | ft -autosize

#Show only active physical network adapters
get-netadapter -physical | ? { $_.status -eq "Up" }

#Show only MacAddress from active physical network adapters
get-netadapter -physical | ? { $_.status -eq "Up" } | % { $_.MacAddress }
