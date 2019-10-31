Param (
   [Parameter(Mandatory=$True)]
   [string]
   $ServerName noname
)


Write-Host "Drive information for $ServerName"
Get-WmiObject Win32_LogicalDisk -ComputerName $ServerName -Filter DriveType=3 | 
Select-Object DeviceID, @{'Name'='Size (GB)'; 'Expression'={[string]::Format('{0:N0}',[math]::truncate($_.size / 1GB))}}, @{'Name'='Freespace (GB)'; 'Expression'={[string]::Format('{0:N0}',[math]::truncate($_.freespace / 1GB))}} | Out-Host

