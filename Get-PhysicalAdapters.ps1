<#
.SYNOPSIS
Get physical network adapters
.DESCRIPTION
Display all physical adapters from the Win32_NetworkAdapter class.
.PARAMETER computername
The computer name, or names, to query.
.EXAMPLE
Get-PhysicalAdapters -Computername SRV02
#>
[CmdletBinding()]
param (
  [Parameter(Mandatory=$True, HelpMessage="Enter a computer name to query")]
  [Alias('hostname')]   
  [string]$Computername
)

Write-Verbose "Getting physical network adapters from $computername"
Get-CimInstance win32_networkadapter -ComputerName $computername |
 Where-Object { $_.PhysicalAdapter } |
 Select-Object MACAddress,AdapterType,DeviceID,Name,Speed
Write-Verbose "Finished running command"
